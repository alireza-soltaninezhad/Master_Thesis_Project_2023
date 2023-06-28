import 'package:flutter/material.dart';
import 'package:medicine_finder/screen/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text("دارویاب", style: TextStyle(fontWeight: FontWeight.w700)),
          ),
          body: SafeArea(
            child: Container(
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
                              Icons.person,
                              color: Colors.orange,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('نام کاربری و رمز را وارد نمایید',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'نام کاربری',
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8.0),
                        child: TextField(
                          obscureText: true,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'رمز ورود',
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 70,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0066AA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {

                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }));

                          },
                          child: const Text(
                            'ورود',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}
