import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  const WebviewScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  // WebViewController? _controller;
  // double _height = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 62, 69, 83),
      ),
      body: WebView(
        // onWebViewCreated: (controller) {
        //   _controller = controller;
        //   controller.loadUrl(url);
        // },
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
