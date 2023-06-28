import 'package:flutter/material.dart';

class AddMedicineDialog extends StatefulWidget {
  const AddMedicineDialog({super.key});

  @override
  AddMedicineDialogState createState() => AddMedicineDialogState();
}

class AddMedicineDialogState extends State<AddMedicineDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commercialNameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: const Text('افزودن دارو'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'نام'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'نام را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _commercialNameController,
                decoration: const InputDecoration(labelText: 'نام تجاری'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'نام تجاری را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _typeController,
                decoration: const InputDecoration(labelText: 'نوع'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'نوع را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(labelText: 'تاریخ خرید'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'تاریخ را وارد کنید';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'قیمت'),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'قیمت را وارد کنید';
                  }
                  if (double.tryParse(value ?? "0") == null) {
                    return 'قیمت را به درستی وارد کنید';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16,),

              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.store, color: Colors.white,),
                      SizedBox(width: 4,),
                      Text("انتخاب داروخانه", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                onPressed: () {
                },
              ),
              const SizedBox(height: 16,),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text('لغو'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          ElevatedButton(
            child: const Text('افزودن'),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final name = _nameController.text;
                final commercialName = _commercialNameController.text;
                final type = _typeController.text;
                final price = double.parse(_priceController.text);

                // TODO: Add the medicine to the database or do something with the data

                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),
    );
  }
}