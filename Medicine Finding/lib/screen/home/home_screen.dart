import 'package:flutter/material.dart';
import 'package:medicine_finder/screen/home/dialog/add_medicine_dialog.dart';
import 'package:medicine_finder/screen/home/dialog/add_pharmacy_dialog.dart';
import 'package:medicine_finder/screen/home/tab/pharmacy_tab.dart';
import 'package:medicine_finder/screen/home/tab/medicine_tab.dart';
import 'package:medicine_finder/screen/home/widget/side_menu.dart';
import 'package:medicine_finder/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: Row(
              children: [
                const Text(
                  "دارویاب",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  width: 32,
                ),
                // Container(
                //   constraints: const BoxConstraints(maxWidth: 500),
                //   child: SizedBox(
                //     height: 42,
                //     child: TextField(
                //       decoration: InputDecoration(
                //         hintText: 'Search medicine...',
                //         hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.8)),
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(100.0),
                //         ),
                //         filled: true,
                //         fillColor: Colors.white.withOpacity(0.2),
                //       ),
                //       style: Theme.of(context)
                //           .textTheme
                //           .bodyMedium
                //           ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 8,
                // ),
                // Material(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(100),
                //   child: InkWell(
                //     borderRadius: BorderRadius.circular(100),
                //     onTap: () {},
                //     child: const Padding(
                //       padding: EdgeInsets.all(4.0),
                //       child: Icon(
                //         Icons.search,
                //         size: 30,
                //         color: Colors.blue,
                //       ),
                //     ),
                //   ),
                // ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "نام کاربری",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        SideMenu(
                          onItemSelected: (int index) {
                            if (selectedMenu != index) {
                              setState(() {
                                selectedMenu = index;
                              });
                            }
                          },
                        ),
                        Visibility(visible: selectedMenu == 0, child: Expanded(child: MedicineTab())),
                        Visibility(visible: selectedMenu == 1, child: Expanded(child: PharmacyTab()))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            key: UniqueKey(),
            backgroundColor: Colors.orange,
            onPressed: () {
              if (selectedMenu == 0) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddMedicineDialog();
                  },
                );
              }
              if (selectedMenu == 1) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddPharmacyDialog();
                  },
                );
              }
            },
            icon: const Icon(Icons.add),
            label: Text(selectedMenu == 0 ? 'افزودن دارو' : 'افزودن داروخانه'),
          )),
    );
  }
}
