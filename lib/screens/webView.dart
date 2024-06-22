import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/textStyle.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _controller
                .runJavaScript('document.querySelector("#wr_1").value = "이름"');
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
            "https://www.seoulhomelessjc.or.kr/bbs/write.php?bo_table=13"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "온라인 일자리 지원",
          style: HomelessTextTheme.md,
        ),
        centerTitle: false,
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
