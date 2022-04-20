import 'package:flutter/material.dart';

import '../../model/advertisement_model.dart';

class IndividualPost extends StatelessWidget {
  Advertisement e;

  IndividualPost(this.e);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, -2),
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.contact,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          e.created.difference(DateTime.now()).inDays == 0
                              ? "Posted today"
                              : e.created.difference(DateTime.now()).inDays.abs() == 1
                                  ? "Posted 1 day ago"
                                  : "Posted ${e.created.difference(DateTime.now()).inDays.abs()} days ago",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3.0),
                        child: Text(
                          "available",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          child: Text("Edit"),
                        ),
                        const PopupMenuItem(
                          child: Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(e.img), fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.home,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                e.residence,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                e.location,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              e.kitchen
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(Icons.set_meal_rounded,
                                              size: 15),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              e.internet
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(Icons.wifi, size: 15),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              e.waterSupply
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Icon(
                                            Icons.water_damage_outlined,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${e.roomCount} rooms,\n${e.parking} parking",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Divider(
                  color: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Rs. " + e.price.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  e.description,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
