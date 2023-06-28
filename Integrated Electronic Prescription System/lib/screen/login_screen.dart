import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurance/main.dart';
import 'package:insurance/screen/config_screen.dart';
import 'package:insurance/screen/home_screen_web.dart'
    if (dart.library.io) 'package:insurance/screen/home_screen.dart';
import 'package:insurance/util/shared_pref_util.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController textEditingController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool built = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapShot) {
        if (snapShot.hasData && snapShot.data is SharedPreferences) {

          MyApp.prefs = SharedPreferencesUtil(snapShot.data);

          if ((snapShot.data?.getString("pass")?.isNotEmpty ?? false) && !built) {
            _authenticateWithFaceId(context);
          }

          built = true;

          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text((snapShot.data?.getString("pass")?.isEmpty ?? true)
                  ? "Register"
                  : "Login"),
            ),
            body: SafeArea(
              child: Container(
                color: Colors.indigo,
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lock,
                                color: Colors.amberAccent,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                (snapShot.data?.getString("pass") ?? "").isEmpty
                                    ? 'Setup password'
                                    : 'Enter password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8.0),
                          child: TextField(
                            obscureText: true,
                            controller: textEditingController,
                            focusNode: _focusNode,
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              counterStyle:
                                  const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (textEditingController.value.text.length ==
                                      4 &&
                                  ((snapShot.data?.getString("pass") ?? "")
                                          .isEmpty ||
                                      snapShot.data?.getString("pass") ==
                                          textEditingController.value.text)) {
                                snapShot.data?.setString(
                                    "pass", textEditingController.value.text);
                                if (snapShot.data?.getBool("config") ?? false) {
                                  // if (kIsWeb) {
                                  //   Navigator.of(context)
                                  //       .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreenWeb()));
                                  // } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                  // }
                                } else {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfigScreen()));
                                }
                              } else {
                                FToast().init(context).showToast(
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: const Text("Wrong Password")),
                                      gravity: ToastGravity.BOTTOM,
                                    );
                              }
                            },
                            child: Text(
                              (snapShot.data?.getString("pass") ?? "").isEmpty
                                  ? 'REGISTER'
                                  : 'LOGIN',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Future<void> _authenticateWithFaceId(BuildContext context) async {
    final bool didAuthenticate = await LocalAuthentication().authenticate(
        localizedReason: 'Please authenticate to login',
        options: const AuthenticationOptions(biometricOnly: true));
    if (didAuthenticate) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
      // }
    }
  }
}
