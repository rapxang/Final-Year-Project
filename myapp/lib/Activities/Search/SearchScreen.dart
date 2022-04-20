import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;

  List<int> selected = [];
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
  @override
  Widget build(BuildContext context) {
    return isSearching
        ? Column(
            children: [
              Container(
                child: Row(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                  ),
                ]),
              ),
              selected.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: const Text("No Results"),
                      ),
                    )
                  : Container(),
              Expanded(
                child: ListView(
                  children: [
                    ...selected
                        .map((e) => Container(
                              height: 100,
                              width: double.infinity,
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      color: Colors.black.withOpacity(0.1))
                                ],
                              ),
                              child: Text(contents[e]),
                            ))
                        .toList()
                  ],
                ),
              ),
            ],
          )
        : Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(12),
                width: double.infinity,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Colors.black.withOpacity(0.5))),
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: const Text(
                  "Location",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Wrap(
                children: contents
                    .asMap()
                    .entries
                    .map((e) => GestureDetector(
                          onTap: () {
                            if (selected.contains(e.key)) {
                              selected.remove(e.key);
                              setState(() {});
                            } else {
                              selected.add(e.key);
                              setState(() {});
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: selected.contains(e.key)
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
                                  color: selected.contains(e.key)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                height: 1,
                width: double.infinity,
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: const Text(
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
                            if (selected.contains(e.key)) {
                              selected.remove(e.key);
                              setState(() {});
                            } else {
                              selected.add(e.key);
                              setState(() {});
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            margin: const EdgeInsets.all(6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: selected.contains(e.key)
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
                                  color: selected.contains(e.key)
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(
                width: 12,
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
                onTap: () {
                  setState(() => isSearching = !isSearching);
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
                    child: const Text(
                      "GO",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ));
  }
}
