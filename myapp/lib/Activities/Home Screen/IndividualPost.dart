import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:myapp/Services/AdvertisementService.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/advertisement_model.dart';
import '../Advertisement/EditProduct.dart';
import 'ConfirmDialog.dart';

class IndividualPost extends StatefulWidget {
  final Advertisement e;
  final Function refresh;

  final Function changeScreen;
  final bool isEditable;

  IndividualPost(this.e, this.refresh, this.changeScreen,
      {this.isEditable = true});

  @override
  State<IndividualPost> createState() => _IndividualPostState();
}

class _IndividualPostState extends State<IndividualPost> {
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
                          widget.e.contact,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.e.created.difference(DateTime.now()).inDays ==
                                  0
                              ? "Posted today"
                              : widget.e.created
                                          .difference(DateTime.now())
                                          .inDays
                                          .abs() ==
                                      1
                                  ? "Posted 1 day ago"
                                  : "Posted ${widget.e.created.difference(DateTime.now()).inDays.abs()} days ago",
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
                          color: widget.e.status ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 3.0),
                        child: Text(
                          widget.e.status ? "available" : "unavailable",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    widget.isEditable
                        ? PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Edit"),
                                onTap: () {
                                  Future.delayed(Duration(milliseconds: 1))
                                      .then((value) => Navigator.push(context,
                                              MaterialPageRoute(builder: (_) {
                                            return EditProduct(
                                                widget.e, widget.changeScreen);
                                          })));
                                },
                              ),
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () {
                                  Future.delayed(Duration(milliseconds: 1))
                                      .then((value) => showDialog(
                                            context: context,
                                            builder: (_) {
                                              return ConfirmDialog(
                                                  widget.e, widget.refresh);
                                            },
                                          ));
                                },
                              ),
                              PopupMenuItem(
                                child: Text(widget.e.status
                                    ? "Unavailable"
                                    : "available"),
                                onTap: () async {
                                  Future.delayed(Duration(milliseconds: 1))
                                      .then((value) async {
                                    await AdvertisementService()
                                        .updateAvailableAdvertisement(
                                            widget.e, !widget.e.status);
                                    widget.refresh();
                                  });
                                },
                              ),
                              PopupMenuItem(
                                child: Text("View on map"),
                                onTap: () {
                                  Future.delayed(Duration(milliseconds: 1))
                                      .then((value) async {
                                    launch(Uri.encodeFull(
                                        "https://www.google.com/maps/search/?api=1&query=${widget.e.latlng.latitude},${widget.e.latlng.longitude}"));
                                    // MapsLauncher.launchCoordinates(widget.e.latlng.latitude, widget.e.latlng.longitude);
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(),
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
                              image: NetworkImage(widget.e.img),
                              fit: BoxFit.cover),
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
                                widget.e.residence,
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
                                widget.e.location,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              widget.e.kitchen
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
                              widget.e.internet
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
                              widget.e.waterSupply
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
                            "${widget.e.roomCount} rooms,\n${widget.e.parking} parking",
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
                  "Rs. " + widget.e.price.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.e.description,
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
