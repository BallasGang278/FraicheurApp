// lib/screens/web_view_screen.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; 

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    Key? key,
    required this.url,
    this.title = 'Site E-commerce', 
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) 
      ..setBackgroundColor(const Color(0x00000000)) 
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            
            debugPrint('WebView is loading (progress: $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(), 
            ),
        ],
      ),
    );
  }
}
