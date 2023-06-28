import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:medicine_finder/model/pharmacy.dart';

class PharmacyMapDialog extends StatelessWidget {
  const PharmacyMapDialog({Key? key, required this.pharmacyList}) : super(key: key);

  final List<Pharmacy> pharmacyList;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(pharmacyList.first.latitude, pharmacyList.first.longitude),
                    zoom: 13.2,
                  ),
                  nonRotatedChildren: [],
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(pharmacyList.first.latitude, pharmacyList.first.longitude),
                          width: 64,
                          height: 64,
                          builder: (context) => const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 48,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(32),
                color: Colors.black.withOpacity(0.75),
                child: Row(
                  children: [
                    Text(
                      pharmacyList.first.name,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(width: 16,),
                    if (pharmacyList.first.phoneNumber != null)
                    Text(
                      pharmacyList.first.phoneNumber ?? "",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    if (pharmacyList.first.phoneNumber != null)
                    SizedBox(width: 16,),
                    Text(
                      pharmacyList.first.address,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () {Navigator.of(context).pop(); },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(Icons.close, size: 32,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
