import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/Screens/Drawer/appDrawer.dart';
import 'package:myapp/Screens/Services/AdvertisementService.dart';

class Advertise extends StatefulWidget {
  const Advertise({Key? key}) : super(key: key);

  @override
  State<Advertise> createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  int? location;
  int? residenceSelected;
  int? parkingSelected;
  bool isInternet = false;
  bool isKitchen = false;
  bool isWater = false;
  double price = 0;
  List<String> contents = [
    "Kathmandu",
    "Bhaktapur",
    "Pokhara",
    "Lalitpur",
    "Birgunj",
    "Janakpur",
    "Biratnagar",
    "Kirtipur",
    "Nepalgunj",
  ];
  List<String> residence = [
    "Room",
    "Flat",
    "House",
  ];
  List parking = [
    [Icons.car_repair, "4 Wheeler"],
    [Icons.motorcycle, "2 Wheeler"],
    [Icons.cancel, "No Parking"],
  ];
  bool isSearching = false;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController roomCountController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Advertise Your Residence'),
        centerTitle: true,
      ),
      //backgroundColor: Color(00FFFF),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
          ])),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Location",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Wrap(
                children: contents
                    .asMap()
                    .entries
                    .map((e) => GestureDetector(
                          onTap: () {
                            location = e.key;
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: location == e.key
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: Text(
                              e.value,
                              style: TextStyle(
                                  color: location == e.key
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                height: 1,
                width: double.infinity,
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Residence Type",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Wrap(
                children: residence
                    .asMap()
                    .entries
                    .map((e) => GestureDetector(
                          onTap: () {
                            residenceSelected = e.key;
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: residenceSelected == e.key
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: Text(
                              e.value,
                              style: TextStyle(
                                  color: residenceSelected == e.key
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Parking Status",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Wrap(
                children: parking
                    .asMap()
                    .entries
                    .map((e) => GestureDetector(
                          onTap: () {
                            parkingSelected = e.key;
                            print(e.key);
                            setState(() {});
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            margin: EdgeInsets.all(6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: parkingSelected == e.key
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  Icon(
                                    e.value[0],
                                    color: parkingSelected == e.key
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    e.value[1],
                                    style: TextStyle(
                                        color: parkingSelected == e.key
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                height: 1,
                width: double.infinity,
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text("Internet Status"),
                    Expanded(child: Container()),
                    ToggleButtons(
                      isSelected: [isInternet, !isInternet],
                      children: [Icon(Icons.wifi), Icon(Icons.cancel)],
                      onPressed: (int i) {
                        isInternet = (i == 0);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text("Kitchen Status"),
                    Expanded(child: Container()),
                    ToggleButtons(
                      isSelected: [isKitchen, !isKitchen],
                      children: [
                        Icon(Icons.set_meal_rounded),
                        Icon(Icons.cancel)
                      ],
                      onPressed: (int i) {
                        isKitchen = (i == 0);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text("Water Supply Status"),
                    Expanded(child: Container()),
                    ToggleButtons(
                      isSelected: [isWater, !isWater],
                      children: [
                        Icon(Icons.water_damage_outlined),
                        Icon(Icons.cancel)
                      ],
                      onPressed: (int i) {
                        isWater = (i == 0);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                      labelText: "contact", border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: "description", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  controller: roomCountController,
                  decoration: InputDecoration(
                      labelText: "room count", border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Text("price"),
                    Expanded(child: Container()),
                    Text(price.toString()),
                  ],
                ),
              ),
              Slider(
                  label: price.toStringAsFixed(0),
                  min: 0,
                  max: 100000,
                  divisions: 100,
                  value: price,
                  onChanged: (double newprice) {
                    price = newprice;
                    setState(() {});
                  }),
              GestureDetector(
                onTap: () {
                  if (parkingSelected != null || location != null) {
                    AdvertisementService()
                        .createAdvertisement(
                            parking: parking[parkingSelected!][1],
                            price: price.ceil(),
                            roomCount: int.parse(roomCountController.text),
                            status: true,
                            waterSupply: isWater,
                            contact: contactController.text,
                            description: descriptionController.text,
                            location: contents[location!],
                            latlng: GeoPoint(0, 0),
                            img: "img",
                            internet: isInternet,
                            residence: residence[residenceSelected!],
                            kitchen: isKitchen)
                        .then((value) => Navigator.pop(context));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill in the details")));
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.1))
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "GO",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
