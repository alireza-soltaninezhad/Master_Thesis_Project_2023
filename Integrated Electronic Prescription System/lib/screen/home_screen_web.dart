import 'dart:convert';
import 'dart:js' as js;

import 'package:file_picker/_internal/file_picker_web.dart' as web;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurance/model/insurance_type.dart';
import 'package:insurance/screen/config_screen.dart';
import 'package:insurance/screen/import_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nationalCodeController = TextEditingController();
  final FocusNode _nationalCodeFocusNode = FocusNode();

  final List<InsuranceType> insuranceList = [
    InsuranceType('Tamin', 'assets/icon/tamin.png', 'https://account.tamin.ir/auth/login'),
    InsuranceType('Salamat', 'assets/icon/salamat.jpg',
        'https://eservices.ihio.gov.ir/sso/?sourceApp=https://eservices.ihio.gov.ir/ihioerx/'),
    InsuranceType('Army', 'assets/icon/army.jpg', 'https://esakhad.esata.ir:9092/authentication/login#/home')
  ];

  @override
  void initState() {
    super.initState();
    selectedInsurance = insuranceList[0];
  }

  InsuranceType? selectedInsurance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insurance"),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Import Patients Data', 'Config Accounts'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (String choice) {
              if (choice == 'Import Patients Data') {
                _importCsv(context);
              }
              if (choice == 'Config Accounts') {
                _configAccount(context);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Patient National Code',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          controller: _nationalCodeController,
                          focusNode: _nationalCodeFocusNode,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                            hintText: 'National Code',
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
                        ),
                      ),
                      Text(
                        'Insurance Type',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16, color: Colors.black87),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blueGrey.withOpacity(0.2),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton<InsuranceType>(
                          isExpanded: true,
                          value: selectedInsurance,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                          underline: const SizedBox.shrink(),
                          onChanged: (InsuranceType? newValue) {
                            setState(() {
                              if (newValue != null) {
                                selectedInsurance = newValue;
                              }
                            });
                          },
                          items: insuranceList.map((InsuranceType insurance) {
                            return DropdownMenuItem<InsuranceType>(
                              value: insurance,
                              child: Row(
                                children: [
                                  Image.asset(
                                    insurance.icon,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(insurance.name),
                                ],
                              ),
                            );
                          }).toList(),
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
                            js.context.callMethod('open', [selectedInsurance?.loginUri]);
                            return;
                          },
                          child: const Text(
                            'WRITE PRESCRIPTION',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
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

  Future<void> _importCsv(BuildContext context) async {
    final result = await web.FilePickerWeb.platform.pickFiles(
      allowedExtensions: ['csv'],
      type: FileType.custom,
    );
    if (result != null) {
      String fileString = const Utf8Decoder().convert(result.files.first.bytes!.toList());
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImportScreen(fileString)));
    }
  }

  void _configAccount(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfigScreen()));
  }
}
