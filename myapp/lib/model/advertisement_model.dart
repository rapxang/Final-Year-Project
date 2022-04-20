import 'package:cloud_firestore/cloud_firestore.dart';

class Advertisement {
  final String id;
  final String parking; //done
  final int price;
  final int roomCount;
  final bool status;
  final bool waterSupply; //done
  final String contact;
  final String description;
  final String location; //done
  final GeoPoint latlng;
  final String img;
  final bool internet; //done
  final bool kitchen; //done
  final String residence; //done
  final DateTime created;

  Advertisement(
      {required this.id,
      required this.parking,
      required this.price,
      required this.roomCount,
      required this.status,
      required this.waterSupply,
      required this.contact,
      required this.description,
      required this.location,
      required this.latlng,
      required this.img,
      required this.internet,
      required this.residence,
      required this.kitchen,
      required this.created});
}

// final String parking; //done
