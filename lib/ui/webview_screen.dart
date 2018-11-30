import 'package:flutter/material.dart';
import 'package:flutter_times/app/strings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({
    Key key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.of(context).articleReader),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.open_in_browser,
              color: Colors.white,
            ),
            onPressed: () => launch(url),
          ),
        ],
      ),
      body: WebView(
        initialUrl: url,
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}
