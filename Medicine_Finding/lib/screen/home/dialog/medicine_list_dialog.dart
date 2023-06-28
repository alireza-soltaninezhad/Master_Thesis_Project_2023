import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicine_finder/model/medicine.dart';

class MedicineListDialog extends StatelessWidget {
  MedicineListDialog({Key? key, required this.pharmacyId}) : super(key: key);

  final int pharmacyId;

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
    Random random = Random();
    int removeCount = random.nextInt(medicines.length);
    for (int i = 0; i < removeCount; i++) {
      int removePosition = random.nextInt(medicines.length);
      medicines.removeAt(removePosition);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.close,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  Text('لیست داروها', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 24),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('شناسه')),
                    DataColumn(label: Text('نام')),
                    DataColumn(label: Text('نام تجاری')),
                    DataColumn(label: Text('نوع')),
                    DataColumn(label: Text('تاریح آخرین موجودی')),
                    DataColumn(label: Text('قیمت')),
                  ],
                  rows: medicines.map((element) {
                    return DataRow(cells: [
                      DataCell(Text(element.id.toString())),
                      DataCell(Text(element.name)),
                      DataCell(Text(element.commercialName ?? "-")),
                      DataCell(Text(element.type)),
                      DataCell(Text(element.date)),
                      DataCell(Text('${element.price} ریال')),
                    ]);
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
