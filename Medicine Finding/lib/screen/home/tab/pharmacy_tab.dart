import 'package:flutter/material.dart';
import 'package:medicine_finder/model/pharmacy.dart';
import 'package:medicine_finder/screen/home/dialog/medicine_list_dialog.dart';
import 'package:medicine_finder/screen/home/dialog/pharmacy_map_dialog.dart';

class PharmacyTab extends StatelessWidget {
  PharmacyTab({Key? key}) : super(key: key);

  final List<Pharmacy> pharmacies = [
    Pharmacy(
        id: 2001,
        name: 'داروخانه تهران',
        address: 'تهران، خیابان ولیعصر، پلاک ۲۰',
        phoneNumber: '021-55552001',
        latitude: 35.6892,
        longitude: 51.3890),
    Pharmacy(
        id: 2002,
        name: 'داروخانه مرکزی اصفهان',
        address: 'اصفهان، خیابان چهارباغ، پلاک ۲۵',
        phoneNumber: '0311-55552002',
        latitude: 32.6546,
        longitude: 51.6679),
    Pharmacy(
        id: 2003,
        name: 'داروخانه تبریز',
        address: 'تبریز، خیابان امام رضا، پلاک ۱۵',
        phoneNumber: '0411-55552003',
        latitude: 38.0864,
        longitude: 46.3012),
    Pharmacy(
        id: 2004,
        name: 'داروخانه شیراز',
        address: 'شیراز، بلوار زند، پلاک ۷',
        phoneNumber: '0711-55552004',
        latitude: 29.5918,
        longitude: 52.5837),
    Pharmacy(
        id: 2005,
        name: 'داروخانه مشهد',
        address: 'مشهد، میدان امام حسین، پلاک ۳۰',
        phoneNumber: '0511-55552005',
        latitude: 36.2605,
        longitude: 59.6168),
    Pharmacy(
        id: 2006,
        name: 'داروخانه رشت',
        address: 'رشت، خیابان راهنمایی، پلاک ۱۲',
        phoneNumber: '0131-55552006',
        latitude: 37.2800,
        longitude: 49.5832),
    Pharmacy(
        id: 2007,
        name: 'داروخانه کرمان',
        address: 'کرمان، حیابان شریعتی، پلاک ۷',
        phoneNumber: '0341-55552007',
        latitude: 30.2833,
        longitude: 57.0833),
    Pharmacy(
        id: 2008,
        name: 'داروخانه مرکزی یزد',
        address: 'یزد، خیابان امام خمینی، پلاک ۱۶',
        phoneNumber: '0351-55552008',
        latitude: 31.8974,
        longitude: 54.3566),
    Pharmacy(
        id: 2009,
        name: 'داروخانه اهواز',
        address: 'اهواز، بلوار جمهوری، پلاک ۳۷',
        phoneNumber: '0611-55552009',
        latitude: 31.3183,
        longitude: 48.6693),
    Pharmacy(
        id: 2010,
        name: 'داروخانه بندرعباس',
        address: 'بندرعباس، خیابان شهید بهشتی، پلاک ۱۶',
        phoneNumber: '0761-55552010',
        latitude: 27.1865,
        longitude: 56.2808),
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
                DataColumn(label: Text('آدرس')),
                DataColumn(label: Text('شماره تلفن')),
                DataColumn(label: Text('موقعیت')),
                DataColumn(label: Text('داروهای موجود')),
              ],
              rows: pharmacies.map((element) {
                return DataRow(cells: [
                  DataCell(Text(element.id.toString())),
                  DataCell(Text(element.name)),
                  DataCell(Text(element.address)),
                  DataCell(Text(element.phoneNumber ?? "-")),
                  DataCell(InkWell(onTap: () {
                    showDialog(context: context, builder: (context) {
                      return Dialog(
                        child: PharmacyMapDialog(
                          pharmacyList: [element],
                        ),
                      );
                    });
                  }, child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.location_on,
                      color: Colors.blue,
                    ),
                  ),)),
                  DataCell(InkWell(onTap: () {
                    showDialog(context: context, builder: (context) {
                      return Dialog(
                        child: MedicineListDialog(
                          pharmacyId: element.id,
                        ),
                      );
                    });
                  }, child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.drag_indicator,
                      color: Colors.blue,
                    ),
                  ),)),
                ]);
              }).toList()),
        ),
      ),
    );
  }
}
