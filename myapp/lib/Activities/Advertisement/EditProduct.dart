import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/model/advertisement_model.dart';

import '../../Services/AdvertisementService.dart';
import 'MapScreen.dart';

class EditProduct extends StatefulWidget {
  final Advertisement advertisement;
  final Function changeScreen;

  EditProduct(this.advertisement, this.changeScreen);

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  bool isSearching = false;

  TextEditingController descriptionController = TextEditingController();

  TextEditingController roomCountController = TextEditingController();

  TextEditingController contactController = TextEditingController();

  LatLng? latlng;

  String? img;
  String? networkImg;
  bool confirmDisabled = false;

  int? location;

  int? residenceSelected;

  int? parkingSelected;

  bool isInternet = false;

  bool isKitchen = false;

  bool isWater = false;

  double price = 0;

  bool isvalidationDone = false;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    descriptionController.text = widget.advertisement.description;
    roomCountController.text = widget.advertisement.roomCount.toString();
    contactController.text = widget.advertisement.contact;
    latlng = LatLng(
      widget.advertisement.latlng.latitude,
      widget.advertisement.latlng.longitude,
    );
    networkImg = widget.advertisement.img;
    location = contents.indexOf(widget.advertisement.location);
    residenceSelected = residence.indexOf(widget.advertisement.residence);
    parkingSelected = parking.indexOf(parking
        .firstWhere((element) => widget.advertisement.parking == element[1]));
    isInternet = widget.advertisement.internet;

    isKitchen = widget.advertisement.kitchen;

    isWater = widget.advertisement.waterSupply;

    price = widget.advertisement.price + 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Edit your post",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: isvalidationDone && (location == null)
                              ? Colors.red
                              : Colors.transparent,
                          width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    margin: const EdgeInsets.all(6),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: location == e.key
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.1))
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
                    ],
                  ),
                ),
                const SizedBox(height: 12,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: isvalidationDone && residenceSelected == null
                              ? Colors.red
                              : Colors.transparent,
                          width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Residence Type",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    margin: const EdgeInsets.all(6),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: residenceSelected == e.key
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.1))
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
                    ],
                  ),
                ),
                const SizedBox(height: 12,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: isvalidationDone && parkingSelected == null
                              ? Colors.red
                              : Colors.transparent,
                          width: 2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Parking Status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    margin: const EdgeInsets.all(6),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: parkingSelected == e.key
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 2),
                                            spreadRadius: 1,
                                            blurRadius: 4,
                                            color:
                                                Colors.black.withOpacity(0.1))
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
                                          const SizedBox(
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
                    ],
                  ),
                ),
                const SizedBox(height: 12,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      const Text("Internet Status"),
                      Expanded(child: Container()),
                      ToggleButtons(
                        isSelected: [isInternet, !isInternet],
                        children: const [Icon(Icons.wifi), Icon(Icons.cancel)],
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
                      const Text("Kitchen Status"),
                      Expanded(child: Container()),
                      ToggleButtons(
                        isSelected: [isKitchen, !isKitchen],
                        children: const [
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
                      const Text("Water Supply Status"),
                      Expanded(child: Container()),
                      ToggleButtons(
                        isSelected: [isWater, !isWater],
                        children: const [
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
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: contactController,
                    onChanged: (input) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: "contact",
                      border: const OutlineInputBorder(),
                      errorText: isvalidationDone &&
                              contactController.text.length != 10
                          ? "contact must be 10 digits"
                          : isvalidationDone &&
                                  int.tryParse(contactController.text) == null
                              ? "contact must be numbers"
                              : null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: descriptionController,
                    onChanged: (input) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: "description",
                      border: const OutlineInputBorder(),
                      errorText:
                          isvalidationDone && descriptionController.text == ""
                              ? "description cannot be empty"
                              : null,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: roomCountController,
                    onChanged: (input) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: "room count",
                      border: const OutlineInputBorder(),
                      errorText: isvalidationDone &&
                              int.tryParse(roomCountController.text) == null
                          ? "room count must be a number"
                          : null,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      const Text("price"),
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
                      price = newprice.ceil() + 0.0;
                      setState(() {});
                    }),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  height: 1,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () async {
                    latlng = await Navigator.push(context,
                        MaterialPageRoute(builder: (_) {
                      return MapScreen();
                    }));
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: isvalidationDone && latlng == null
                              ? Colors.red
                              : Colors.black.withOpacity(0.5),
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                      child: Text(
                        latlng == null
                            ? "No location chosen"
                            : "chosen: (${latlng?.latitude.toStringAsFixed(2)}, ${latlng?.longitude.toStringAsFixed(2)})",
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      allowMultiple: false,
                      dialogTitle: "Select image for advertisement",
                      allowCompression: false,
                    );
                    if (result != null) {
                      img = result.files[0].path;
                      setState(() {});
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          color: isvalidationDone && img == null
                              ? Colors.red
                              : Colors.black.withOpacity(0.5),
                          style: BorderStyle.solid),
                    ),
                    child: img == null
                        ? Image.network(networkImg!)
                        : Image.file(File(img!)),
                  ),
                ),
              ],
            ),
          ),
          confirmDisabled
              ? GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.1))
                      ],
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () async {
                    confirmDisabled = true;
                    setState(() {});
                    if (parkingSelected != null &&
                        location != null &&
                        residenceSelected != null &&
                        int.tryParse(roomCountController.text) != null &&
                        int.tryParse(contactController.text) != null &&
                        contactController.text.length == 10 &&
                        descriptionController.text != "" &&
                        latlng != null) {
                      String downloadurl = networkImg!;
                      if (img != null) {
                        final storageRef = FirebaseStorage.instance.ref().child(
                            "${DateTime.now()}/${(img!).split(r"\").last}");
                        final p0 = await storageRef.putFile(File((img!)));
                        downloadurl = await p0.ref.getDownloadURL();
                      }
                      print(downloadurl);
                      await AdvertisementService()
                          .editAdvertisement(
                              id: widget.advertisement.id,
                              parking: parking[parkingSelected!][1],
                              price: price.ceil(),
                              roomCount: int.parse(roomCountController.text),
                              status: true,
                              waterSupply: isWater,
                              contact: contactController.text,
                              description: descriptionController.text,
                              location: contents[location!],
                              latlng:
                                  GeoPoint(latlng!.latitude, latlng!.longitude),
                              img: downloadurl,
                              internet: isInternet,
                              residence: residence[residenceSelected!],
                              kitchen: isKitchen)
                          .then((value) {
                        location = null;
                        residenceSelected = null;
                        parkingSelected = null;
                        img = null;
                        networkImg = null;
                        latlng = null;
                        isInternet = false;
                        isKitchen = false;
                        isWater = false;
                        price = 0;
                        isvalidationDone = false;
                        roomCountController.text = "";
                        contactController.text = "";
                        descriptionController.text = "";
                        setState(() {});
                        widget.changeScreen(0);
                        Navigator.pop(context);
                        return;
                      }).onError((error, stackTrace) {
                        return;
                      });
                    } else {
                      isvalidationDone = true;
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please fill in the details")));
                    }

                    confirmDisabled = false;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            color: Colors.black.withOpacity(0.1))
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
