// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformWebView extends StatefulWidget {
  final String url;

  const PlatformWebView({required this.url, super.key});

  @override
  _PlatformWebViewState createState() => _PlatformWebViewState();
}

class _PlatformWebViewState extends State<PlatformWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  bool _isConnected = true;
  String? _errorMessage;
  late final Connectivity _connectivity;
  late final Stream<ConnectivityResult> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivityStream = _connectivity.onConnectivityChanged.map(
        (resultList) =>
            resultList.isNotEmpty ? resultList.first : ConnectivityResult.none);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));

    // Check initial connectivity and set up listener
    _checkConnectivity();
    _connectivityStream.listen((ConnectivityResult result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
        if (_isConnected && _hasError) {
          _reloadPage(); // Reload page if connection is restored
        }
      });
    });
  }

  Future<void> _checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  Future<bool> _onWillPop() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return false; // Prevent popping the screen
    }
    return true; // Allow popping the screen
  }

  Future<void> _reloadPage() async {
    setState(() {
      _hasError = false;
      _errorMessage = null;
      _isLoading = true;
    });
    await _controller.loadRequest(Uri.parse(widget.url));
  }

  Widget _buildWebView() {
    return WebViewWidget(
      controller: _controller
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
                _hasError = false;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
            onWebResourceError: (WebResourceError error) {
              setState(() {
                _isLoading = false;
                _hasError = true;
                _errorMessage = error.description;
              });
            },
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform WebView"),
          actions: [
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.black),
              ),
          ],
        ),
        body: !_isConnected
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.red, size: 64),
                    const SizedBox(height: 16),
                    const Text(
                      'No Internet Connection',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _checkConnectivity,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              )
            : _hasError
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 64),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _errorMessage ??
                                'Failed to load page. Please try again.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _reloadPage,
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _reloadPage,
                    child: _buildWebView(),
                  ),
        bottomNavigationBar: _hasError
            ? BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: _reloadPage,
                    ),
                    Expanded(
                      child: Text(
                        _errorMessage ?? 'Failed to load page. Please refresh.',
                        style: const TextStyle(color: Colors.red),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
