import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImportScreen extends StatefulWidget {
  final String file;

  const ImportScreen(this.file, {Key? key}) : super(key: key);

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  final List<List<dynamic>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Import patients data"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: UniqueKey(),
        onPressed: () {
          FToast().init(context).showToast(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration:
                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: const Text("Save Data")),
            gravity: ToastGravity.BOTTOM, );},
        icon: const Icon(Icons.save),
        label: const Text("Save"),
      ),
      body: FutureBuilder(
          future: loadAsset(context),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildRows(context, data.length),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  List<Widget> _buildCells(BuildContext context, List<dynamic> row) {
    return List.generate(
      row.length,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 50.0,
        color: Colors.white,
        margin: const EdgeInsets.all(4.0),
        child: Text(row[index].toString(),
            style: Theme.of(context).textTheme.titleSmall, overflow: TextOverflow.fade, maxLines: 3),
      ),
    );
  }

  List<Widget> _buildRows(BuildContext context, int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(context, data[index]),
      ),
    );
  }

  loadAsset(BuildContext context) async {
    final myData = widget.file;
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);

    data.addAll(csvTable);
    debugPrint(data.toString());
  }
}
