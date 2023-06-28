import 'package:flutter/material.dart';
import 'package:medicine_finder/model/medicine.dart';
import 'package:medicine_finder/screen/home/dialog/pharmacy_list_dialog.dart';

class MedicineTab extends StatelessWidget {
  MedicineTab({Key? key}) : super(key: key);

  final List<Medicine> medicines = [
    Medicine(id: 1, name: 'Paracetamol', commercialName: 'Crocin', type: 'قرص', price: 50000, date: "1402/04/01"),
    Medicine(id: 2, name: 'Ibuprofen', commercialName: 'Advil', type: 'کپسول', price: 90000, date: "1402/04/02"),
    Medicine(id: 3, name: 'Metformin', commercialName: 'Glucophage', type: 'قرص', price: 110000, date: "1402/03/29"),
    Medicine(id: 4, name: 'Amlodipine', commercialName: 'Norvasc', type: 'قرص', price: 150000, date: "1402/02/14"),
    Medicine(id: 5, name: 'Atorvastatin', commercialName: 'Lipitor', type: 'قرص', price: 230000, date: "1402/04/01"),
    Medicine(id: 6, name: 'Omeprazole', commercialName: 'Prilosec', type: 'کپسول', price: 100000, date: "1402/04/02"),
    Medicine(id: 7, name: 'Montelukast', commercialName: 'Singulair', type: 'قرص', price: 140000, date: "1402/03/19"),
    Medicine(id: 8, name: 'Fluticasone', commercialName: 'Flonase', type: 'اسپری', price: 170000, date: "1402/03/23"),
    Medicine(id: 9, name: 'Cetirizine', commercialName: 'Zyrtec', type: 'قرص', price: 80000, date: "1402/01/15"),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('شناسه')),
                DataColumn(label: Text('نام')),
                DataColumn(label: Text('نام تجاری')),
                DataColumn(label: Text('نوع')),
                DataColumn(label: Text('قیمت')),
                DataColumn(label: Text('تاریخ آخرین موجودی')),
                DataColumn(label: Text('لیست داروخانه‌ها')),
              ], rows: medicines.map((element) {
            return DataRow(cells: [
              DataCell(Text(element.id.toString())),
              DataCell(Text(element.name)),
              DataCell(Text(element.commercialName ?? "-")),
              DataCell(Text(element.type)),
              DataCell(Text('${element.price} ریال')),
              DataCell(Text(element.date)),
              DataCell(InkWell(onTap: () {
                showDialog(context: context, builder: (context) {
                  return Dialog(
                    child: PharmacyListDialog(
                      medicineId: element.id,
                    ),
                  );
                });
              }, child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.store,
                  color: Colors.blue,
                ),
              ),)),        ]);
          }).toList()),
        ),
      ),
    );
  }
}
