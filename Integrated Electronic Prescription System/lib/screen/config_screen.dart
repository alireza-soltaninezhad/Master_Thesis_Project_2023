import 'package:flutter/material.dart';
import 'package:insurance/main.dart';
import 'package:insurance/screen/home_screen.dart';

class ConfigScreen extends StatelessWidget {
  ConfigScreen({Key? key}) : super(key: key);

  final TextEditingController _taminUserController = TextEditingController(text: MyApp.prefs?.getString("taminUser"));
  final TextEditingController _taminPassController = TextEditingController(text: MyApp.prefs?.getString("taminPass"));
  final TextEditingController _salamatUserController = TextEditingController(text: MyApp.prefs?.getString("salamatUser"));
  final TextEditingController _salamatPassController = TextEditingController(text: MyApp.prefs?.getString("salamatPass"));
  final TextEditingController _armyUserController = TextEditingController(text: MyApp.prefs?.getString("armyUser"));
  final TextEditingController _armyPassController = TextEditingController(text: MyApp.prefs?.getString("armyPass"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurations"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Enter username and password of portals.',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Tamin Insurance',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _taminUserController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _taminPassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Salamat Insurance',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _salamatUserController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _salamatPassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Army Insurance',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _armyUserController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _armyPassController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            counterStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2)),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 58,
                        margin: const EdgeInsets.symmetric(vertical: 32.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            MyApp.prefs?.setString("taminUser", _taminUserController.value.text);
                            MyApp.prefs?.setString("taminPass", _taminPassController.value.text);
                            MyApp.prefs?.setString("salamatUser", _salamatUserController.value.text);
                            MyApp.prefs?.setString("salamatPass", _salamatPassController.value.text);
                            MyApp.prefs?.setString("armyUser", _armyUserController.value.text);
                            MyApp.prefs?.setString("armyPass", _armyPassController.value.text);

                            if (MyApp.prefs?.getBool("config") ?? false) {
                              Navigator.of(context).pop();
                            } else {
                              MyApp.prefs?.setBool("config", true);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                            }
                          },
                          child: const Text(
                            'SAVE',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
