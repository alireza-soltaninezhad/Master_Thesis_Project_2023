import 'package:flutter/material.dart';
import 'package:insurance/main.dart';
import 'package:insurance/model/insurance_type.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final InsuranceType insuranceType;
  final String nationalCode;

  const WebViewScreen({Key? key, required this.insuranceType, this.nationalCode = ""}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _webViewController;
  final _formValues = {'username': 'admin', 'password': 'test'};

  bool attemptedLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (String url) async {
          // Fill form values when page finished loading
          if (widget.insuranceType.name == "Tamin") {
            _webViewController
                .runJavaScript('document.getElementById("username").value = "${MyApp.prefs?.getString('taminUser')}";');
            _webViewController
                .runJavaScript('document.getElementById("password").value = "${MyApp.prefs?.getString('taminPass')}";');
          }
          if (widget.insuranceType.name == "Army") {
            _webViewController
                .runJavaScript('document.getElementById("username").value = "${MyApp.prefs?.getString('armyUser')}";');
            _webViewController
                .runJavaScript('document.getElementById("password").value = "${MyApp.prefs?.getString('armyPass')}";');
          }
          if (widget.insuranceType.name == "Salamat") {
            _webViewController
                .runJavaScript('document.getElementById("username").value = "${MyApp.prefs?.getString('salamatUser')}";');
            _webViewController
                .runJavaScript('document.getElementById("password").value = "${MyApp.prefs?.getString('salamatPass')}";');
          }
          // if (widget.insuranceType.name == "Army") {
          //   _webViewController.runJavaScript('document.getElementById("username").value = "${MyApp.prefs?.getString('armyUser')}";');
          //   _webViewController.runJavaScript('document.getElementById("password").value = "${MyApp.prefs?.getString('armyPass')}";');
          // }
          // if (widget.insuranceType.name == "Salamat") {
          //   Future.delayed(const Duration(seconds: 1)).then((value) {
          //     _webViewController
          //         .runJavaScript('document.getElementById("gwt-uid-2").value = "${MyApp.prefs?.getString('salamatUser')}";');
          //     _webViewController
          //         .runJavaScript('document.getElementById("gwt-uid-3").value = "${MyApp.prefs?.getString('salamatPass')}";');
          //   });
          // }
          if (!attemptedLogin) {
    //         if (widget.insuranceType.name == "Tamin") {
    //           _webViewController.runJavaScript("""const cookies = document.cookie.split(";");
    //
    // for (let i = 0; i < cookies.length; i++) {
    //     const cookie = cookies[i];
    //     const eqPos = cookie.indexOf("=");
    //     const name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    //     document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    // }""");
    //         }
            Future.delayed(const Duration(seconds: 1)).then((value) {
              // if (widget.insuranceType.name == "Tamin") {
                _webViewController.runJavaScript('document.getElementsByClassName("btn-primary")[0].click();');
              // }
              // if (widget.insuranceType.name == "Army") {
              //   _webViewController.runJavaScript('document.getElementById("login").click();');
              // }
            });
            attemptedLogin = true;
          }
        },
      ))
      ..loadRequest(Uri.parse(widget.insuranceType.loginUri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write prescription"),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: _webViewController,
        ),
      ),
    );
  }
}
