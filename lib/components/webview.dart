import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:vatapp/menuitem/importantlink.dart';
import 'package:vatapp/pages/homepage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../constants.dart';
import 'mydrawer.dart';

WebViewController controllerGlobal;

Future<bool> _exitApp(BuildContext context) async {
  print("will pop called");
  if (await controllerGlobal.canGoBack()) {
    print("on will go back");
    controllerGlobal.goBack();
  } else {
    print("true or false");

    return Future.value(true);
  }
}

class MyWebView extends StatefulWidget {
  String title;
  String selectedUrl;

  MyWebView({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.selectedUrl);
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              /* if (widget.title == 'বিন সার্চ') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return ImportLink();
                }));
              }*/
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff056608),
          title: Text(
            '${widget.title}',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            NavigationControls(_controller.future),
          ],
        ),
        body: Stack(
          children: <Widget>[
            WebView(
              onPageFinished: (str) {
                print("webview start....");
                print(str);
                setState(() {
                  loading = false;
                });
              },
              initialUrl: widget.selectedUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              navigationDelegate: (NavigationRequest request) {
                if (request.url.startsWith('${widget.selectedUrl}')) {
                  print('blocking navigation to $request}');
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                return NavigationDecision.navigate;
              },
              gestureNavigationEnabled: true,
            ),
            (loading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        controllerGlobal = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed:
                  /*!webViewReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : */
                  () async {
                if (await controller.canGoBack()) {
                  await controller.goBack();
                } else {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text("No back history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed:
                  /* !webViewReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : */
                  () async {
                if (await controller.canGoForward()) {
                  await controller.goForward();
                } else {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text("No forward history item")),
                  );
                  return;
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                print("reloading");
                controller.reload();
              },
            ),
          ],
        );
      },
    );
  }
}
