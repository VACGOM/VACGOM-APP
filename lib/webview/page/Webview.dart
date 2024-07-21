import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';
import 'package:vacgom_app/webview/ipc/handler/token.dart';
import 'package:vacgom_app/webview/ipc/message/Message.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WebviewState();
  }
}

class WebviewState extends State<Webview> {
  final WebViewController _controller = WebViewController();
  final BehaviorSubject<Message> inputStream = BehaviorSubject<Message>();

  void initState() {
    super.initState();

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse("http://localhost:3000/home"))
      ..setOnJavaScriptAlertDialog((request) async {
        print(request);
        return null;
      })
      ..setOnConsoleMessage((message) {
        print(message.message);
      })
      ..addJavaScriptChannel("flutter", onMessageReceived: _handleMessage);

    TokenHandler(TokenRepository()).register(inputStream);
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
    return Scaffold(
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
        body: WebViewWidget(
          controller: _controller,
        ));
  }
}
