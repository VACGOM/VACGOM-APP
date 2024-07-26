import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';
import 'package:vacgom_app/webview/ipc/handler/nickname.dart';
import 'package:vacgom_app/webview/ipc/handler/setblue.dart';
import 'package:vacgom_app/webview/ipc/handler/token.dart';
import 'package:vacgom_app/webview/ipc/message/Message.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';
import 'package:vacgom_app/webview/statusbar/statusbar_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../ipc/handler/back.dart';

class Webview extends StatefulWidget {
  Webview({Key? key}) : super(key: key);

  int progress = 0;

  @override
  State<StatefulWidget> createState() {
    return WebviewState();
  }
}

class WebviewState extends State<Webview> {
  final WebViewController _controller = WebViewController();
  final BehaviorSubject<Message> inputStream = BehaviorSubject<Message>();

  bool isBlueStatusBar = false;
  bool showBottomBar = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnJavaScriptAlertDialog((request) async {
        print(request);
        return null;
      })
      ..setOnConsoleMessage((message) {
        print(message.message);
      })
      ..addJavaScriptChannel("flutter", onMessageReceived: _handleMessage)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) {
          setState(() {
            widget.progress = progress;
            if (progress == 100) {
              isLoading = false;
            }
          });
        },
        onPageStarted: (url) {
          setState(() {
            isLoading = true;
          });
        },
      ));

    TokenHandler(TokenRepository()).register(inputStream);
    NicknameHandler(FlutterSecureStorage()).register(inputStream);
    BackHandler(context).register(inputStream);
    SetBlueHandler(context).register(inputStream);

    final state = context.read<WebViewRouteBloc>().state;
    isBlueStatusBar = state.isBlueStatusBar;
    _controller.loadRequest(Uri.parse(state.url));
    showBottomBar = state.showBottomBar;
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
    return MultiBlocListener(
      listeners: [
        BlocListener<WebViewRouteBloc, WebViewRouteState>(
          listener: (context, state) async {
            print("Received state: $state");
            setState(() {
              isLoading = true;
              isBlueStatusBar = state.isBlueStatusBar;
              showBottomBar = state.showBottomBar;
            });
            _controller.loadRequest(Uri.parse(state.url));
          },
        ),
        BlocListener<WebViewRouteBloc, WebViewRouteState>(
          listener: (context, state) async {
            print("Received state: $state");
            setState(() {
              isLoading = true;
              isBlueStatusBar = state.isBlueStatusBar;
              showBottomBar = state.showBottomBar;
            });
            _controller.loadRequest(Uri.parse(state.url));
          },
        ),
        BlocListener<StatusbarBloc, StatusbarState>(listener: (context, state) {
          setState(() {
            isBlueStatusBar = state.isBlueStatusBar;
          });
        })
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: isBlueStatusBar
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
            backgroundColor: isBlueStatusBar ? Color(0xff4196FD) : Colors.white,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff4196FD),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutRequested());
              },
            ),
            body: SafeArea(
              bottom: showBottomBar,
              child: Stack(
                children: [
                  WebViewWidget(
                    controller: _controller,
                  ),
                  if (isLoading)
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: isBlueStatusBar
                              ? Color(0xff4196FD)
                              : Colors.white),
                      child: Container(),
                    )
                ],
              ),
            )),
      ),
    );
  }
}
