import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myapp/Services/AdvertisementService.dart';
import 'package:myapp/model/advertisement_model.dart';

import '../Advertisement/MapScreen.dart';
import 'SearchResultScreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
  List<int> selected = [];

  bool confirmDisabled = false;
  int? location;
  int? residenceSelected;
  int? parkingSelected;
  bool isInternet = false;
  bool isKitchen = false;
  bool isWater = false;
  double minprice = 0;
  double maxprice = 100000;
  double roomCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            location = null;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: location != null
                                  ? Colors.white
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: Text(
                              "any",
                              style: TextStyle(
                                  color: location != null
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )
                      ],
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
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Residence Type",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            residenceSelected = null;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: residenceSelected != null
                                  ? Colors.white
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: Text(
                              "any",
                              style: TextStyle(
                                  color: residenceSelected != null
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )
                      ],
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
                ],
              ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Text(
                          "Parking Status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            parkingSelected = null;
                            setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: parkingSelected != null
                                  ? Colors.white
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                            ),
                            child: Text(
                              "any",
                              style: TextStyle(
                                  color: parkingSelected != null
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )
                      ],
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    const Text("Internet Status"),
                    Expanded(child: Container()),
                    ToggleButtons(
                      isSelected: [isInternet, !isInternet],
                      children: const [Icon(Icons.wifi), Text("any")],
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
                        Text("any")
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
                        Text("any")
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
                    const Text("minimum rooms"),
                    Expanded(child: Container()),
                    Text(roomCount.toStringAsFixed(0)),
                  ],
                ),
              ),
              Slider(
                  label: roomCount.toStringAsFixed(0),
                  min: 0,
                  max: 5,
                  divisions: 5,
                  value: roomCount,
                  onChanged: (double newroomCount) {
                    roomCount = newroomCount.ceil() + 0.0;
                    setState(() {});
                  }),
              const SizedBox(
                width: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    const Text("price range"),
                    Expanded(child: Container()),
                    Text(minprice.toStringAsFixed(0) +
                        " - " +
                        maxprice.toStringAsFixed(0)),
                  ],
                ),
              ),
              RangeSlider(
                min: 0,
                max: 100000,
                divisions: 100,
                onChanged: (RangeValues newprice) {
                  minprice = newprice.start.ceil() + 0.0;

                  maxprice = newprice.end.ceil() + 0.0;
                  setState(() {});
                },
                values: RangeValues(minprice, maxprice),
              ),
              const SizedBox(
                width: 12,
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
                  List<Advertisement> advertisements = await AdvertisementService().findRooms(
                      internet: isInternet,
                      kitchen: isKitchen,
                      location: location != null ? contents[location!] : null,
                      maxprice: maxprice.ceil(),
                      minprice: minprice.ceil(),
                      parking: parkingSelected != null
                          ? parking[parkingSelected!][1]
                          : null,
                      residence: residenceSelected != null
                          ? residence[residenceSelected!]
                          : null,
                      roomCount: roomCount.ceil(),
                      waterSupply: isWater);
                  confirmDisabled = false;
                  setState(() {});
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return SearchResultScreen(advertisements);
                  }));
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
                      "Find",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
