import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';
import 'package:vacgom_app/webview/ipc/handler/getLocation.dart';
import 'package:vacgom_app/webview/ipc/handler/goHome.dart';
import 'package:vacgom_app/webview/ipc/handler/nickname.dart';
import 'package:vacgom_app/webview/ipc/handler/quit.dart';
import 'package:vacgom_app/webview/ipc/handler/setblue.dart';
import 'package:vacgom_app/webview/ipc/handler/token.dart';
import 'package:vacgom_app/webview/ipc/message/Message.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';
import 'package:vacgom_app/webview/statusbar/statusbar_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../ipc/handler/back.dart';
import '../ipc/handler/logout.dart';

class Webview extends StatefulWidget {
  Webview(
      {Key? key,
      this.url = null,
      this.isBlueStatusBar = false,
      this.showBottomBar = false})
      : super(key: key);

  String? url;
  int progress = 0;
  bool isBlueStatusBar = false;
  bool showBottomBar = false;

  @override
  State<StatefulWidget> createState() {
    return WebviewState();
  }
}

class WebviewState extends State<Webview> {
  final WebViewController _controller = WebViewController();
  final BehaviorSubject<Message> inputStream = BehaviorSubject<Message>();

  bool isLoading = true;
  bool showBottomBar = false;

  @override
  void initState() {
    super.initState();

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("flutter", onMessageReceived: _handleMessage)
      ..enableZoom(false)
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          print(request.url);
          return NavigationDecision.navigate;
        },
        onProgress: (progress) {
          if (mounted)
            return setState(() {
              widget.progress = progress;
              if (progress == 100) {
                isLoading = false;
              }
            });
        },
        onPageStarted: (url) {
          if (mounted)
            return setState(() {
              isLoading = true;
              showBottomBar = this.showBottomBar;
            });
        },
      ));

    TokenHandler(TokenRepository()).register(inputStream);
    NicknameHandler(FlutterSecureStorage()).register(inputStream);
    BackHandler(context).register(inputStream);
    SetBlueHandler(context).register(inputStream);
    GoHomeHandler(context).register(inputStream);
    GetLocationHandler(context).register(inputStream);
    LogoutHandler(context).register(inputStream);
    QuitHandler(context).register(inputStream);
    final state = context.read<WebViewRouteBloc>().state;

    if (this.widget.url != null) {
      _controller.loadRequest(Uri.parse(this.widget.url!));
    } else {
      _controller.loadRequest(Uri.parse(state.url));
    }

    widget.showBottomBar = state.showBottomBar;
  }

  void _sendMessage(String message) {
    _controller.runJavaScript("window.webviewPostMessage(`$message`)");
  }

  void _handleMessage(JavaScriptMessage message) {
    Map<String, dynamic> data = jsonDecode(message.message);

    print("Received message: ${message.message}");
    inputStream.add(Message(
        type: data["type"],
        data: data["data"],
        resolve: (dynamic res) {
          Map<String, dynamic> response = {};
          response['data'] = res;
          response['id'] = data['id'];
          response['type'] = data['type'];
          _sendMessage(jsonEncode(response));
        }));
  }

  @override
  Widget build(BuildContext context) {
    print(this.showBottomBar);
    return MultiBlocListener(
      listeners: [
        BlocListener<WebViewRouteBloc, WebViewRouteState>(
          listener: (context, state) async {
            print("Received state: $state");
            if (mounted)
              return setState(() {
                isLoading = true;
                widget.isBlueStatusBar = state.isBlueStatusBar;
                showBottomBar = state.showBottomBar;
              });
            _controller.loadRequest(Uri.parse(state.url));
          },
        ),
        BlocListener<WebViewRouteBloc, WebViewRouteState>(
          listener: (context, state) async {
            print("Received state: $state");
            if (mounted)
              return setState(() {
                isLoading = true;
                widget.isBlueStatusBar = state.isBlueStatusBar;
                showBottomBar = state.showBottomBar;
              });
            _controller.loadRequest(Uri.parse(state.url));
          },
        ),
        BlocListener<StatusbarBloc, StatusbarState>(listener: (context, state) {
          if (mounted)
            return setState(() {
              widget.isBlueStatusBar = state.isBlueStatusBar;
            });
        })
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: widget.isBlueStatusBar
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor:
                widget.isBlueStatusBar ? Color(0xff4196FD) : Colors.white,
            body: SafeArea(
              bottom: showBottomBar,
              child: Stack(
                children: [
                  WebViewWidget(
                    controller: _controller,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
