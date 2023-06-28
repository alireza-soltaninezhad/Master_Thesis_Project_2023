import 'package:flutter/material.dart';

class AddPharmacyDialog extends StatefulWidget {
  const AddPharmacyDialog({Key? key}) : super(key: key);

  @override
  State<AddPharmacyDialog> createState() => _AddPharmacyDialogState();
}

class _AddPharmacyDialogState extends State<AddPharmacyDialog> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('افزودن داروخانه'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'نام',
                ),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'آدرس',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'شماره تلفن',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('لغو'),
          ),
          ElevatedButton(
            onPressed: () {
              final String name = _nameController.text;
              final String address = _addressController.text;
              final String phone = _phoneController.text;

              // Here you can save the data to a database or do anything else
              // you want with it. For now, we'll just print the values.
              debugPrint('Name: $name, Address: $address, Phone Number: $phone');

              Navigator.of(context).pop();
            },
            child: const Text('ذخیره'),
          ),
        ],
      ),
    );
  }
}
