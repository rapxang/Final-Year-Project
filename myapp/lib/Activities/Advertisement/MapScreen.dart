import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng initial = const LatLng(27.727932438767528, 85.33983640616191);
  GoogleMapController? controller;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, initial);
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: initial,
                ),
                onTap: (LatLng tap){
                  initial = tap;
                  setState(() {

                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  this.controller = controller;
                  Geolocator.checkPermission().then(
                    (value) async {
                      await Geolocator.requestPermission();
                      try {
                        Geolocator.getCurrentPosition().then(
                          (position) {
                            initial =
                                LatLng(position.latitude, position.longitude);
                            setState(() {});
                            return controller.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                    target: LatLng(
                                        position.latitude, position.longitude),
                                    zoom: 14),
                              ),
                            );
                          },
                        );
                      } catch (e) {}
                    },
                  );
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                markers: {
                  Marker(
                      markerId: MarkerId("1"),
                      position: initial,
                      infoWindow: InfoWindow(title: "chosen location")),
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, initial);
              },
              child: Container(
                height: 60,
                color: Colors.green,
                child: Center(
                    child: Text(
                  "Select",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
