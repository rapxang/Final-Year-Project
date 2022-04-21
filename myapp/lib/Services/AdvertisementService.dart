import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/advertisement_model.dart';

class AdvertisementService {
  Future<List<Advertisement>> findRooms(
      {String? parking,
      int? maxprice,
      int? minprice,
      int? roomCount,
      bool? waterSupply,
      String? location,
      bool? internet,
      String? residence,
      bool? kitchen}) async {
    QuerySnapshot<
        Map<String,
            dynamic>> advertisementsParsable = await FirebaseFirestore.instance
        .collection('Advertisement')
        .where('parking', isEqualTo: parking)
        // .where("price",
        //     isLessThanOrEqualTo: maxprice, isGreaterThanOrEqualTo: minprice)
        // .where("room_count", isGreaterThanOrEqualTo: roomCount)
        .where('location', isEqualTo: location)
        .where('residence', isEqualTo: residence)
        .where('water_supply',
            isEqualTo: waterSupply == null
                ? null
                : waterSupply
                    ? true
                    : null)
        .where('kitchen',
            isEqualTo: kitchen == null
                ? null
                : kitchen
                    ? true
                    : null)
        .where('internet',
            isEqualTo: internet == null
                ? null
                : internet
                    ? true
                    : null)
        .get();
    List<Advertisement> advertisements = advertisementsParsable.docs.map((e) {
      Map<String, dynamic> parsable = e.data();
      Timestamp a = parsable["created"];
      DateTime created =
          DateTime.fromMicrosecondsSinceEpoch(a.microsecondsSinceEpoch);
      Advertisement ad = Advertisement(
        id: e.id,
        parking: parsable["parking"],
        price: parsable["price"],
        roomCount: parsable["room_count"],
        status: parsable["status"],
        waterSupply: parsable["water_supply"],
        contact: parsable["contact"],
        description: parsable["description"],
        location: parsable["location"],
        latlng: parsable["geopoint"],
        img: parsable["img"],
        internet: parsable["internet"],
        residence: parsable["residence"],
        kitchen: parsable["kitchen"],
        created: created,
      );
      return ad;
    }).toList();
    return advertisements
        .where((element) =>
            (element.roomCount > (roomCount ?? 0)) &&
            (element.price <= (maxprice ?? 0)) &&
            (element.price >= (minprice ?? 0)) &&
            element.status)
        .toList();
  }

  Future<void> deleteAdvertisement(Advertisement advertisement) async {
    await FirebaseFirestore.instance
        .collection('Advertisement')
        .doc(advertisement.id)
        .delete();
  }

  Future<List<Advertisement>> getAdvertisements() async {
    QuerySnapshot<Map<String, dynamic>> advertisementsParsable =
        await FirebaseFirestore.instance
            .collection('Advertisement')
            .where('user', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
            .get();
    List<Advertisement> advertisements = advertisementsParsable.docs.map((e) {
      Map<String, dynamic> parsable = e.data();
      Timestamp a = parsable["created"];
      DateTime created =
          DateTime.fromMicrosecondsSinceEpoch(a.microsecondsSinceEpoch);
      Advertisement ad = Advertisement(
        id: e.id,
        parking: parsable["parking"],
        price: parsable["price"],
        roomCount: parsable["room_count"],
        status: parsable["status"],
        waterSupply: parsable["water_supply"],
        contact: parsable["contact"],
        description: parsable["description"],
        location: parsable["location"],
        latlng: parsable["geopoint"],
        img: parsable["img"],
        internet: parsable["internet"],
        residence: parsable["residence"],
        kitchen: parsable["kitchen"],
        created: created,
        // created: DateTime.now()
      );
      return ad;
    }).toList();
    return advertisements;
  }

  Future<bool> updateAvailableAdvertisement(
      Advertisement advertisement, bool status) async {
    bool success = true;
    try {
      await FirebaseFirestore.instance
          .collection('Advertisement')
          .doc(advertisement.id)
          .update({"status": status}).onError((error, stackTrace) {
        throw "error";
      });
    } catch (E) {
      success = false;
    }
    return success;
  }

  Future<bool> editAdvertisement(
      {required String id,
      required String parking,
      required int price,
      required int roomCount,
      required bool status,
      required bool waterSupply,
      required String contact,
      required String description,
      required String location,
      required GeoPoint latlng,
      required String img,
      required bool internet,
      required String residence,
      required bool kitchen}) async {
    Timestamp a = Timestamp.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);
    Map<String, dynamic> data = {
      "parking": parking,
      "price": price,
      "room_count": roomCount,
      "status": status,
      "water_supply": waterSupply,
      "contact": contact,
      "description": description,
      "location": location,
      "geopoint": latlng,
      "img": img,
      "internet": internet,
      "residence": residence,
      "kitchen": kitchen,
      "user": FirebaseAuth.instance.currentUser?.uid,
      "created": a,
    };
    bool success = true;
    DocumentReference<Map<String, dynamic>>? advertisementsParsable;
    try {
      await FirebaseFirestore.instance
          .collection('Advertisement')
          .doc(id)
          .update(data)
          .onError((error, stackTrace) {
        throw "error";
      });
    } catch (E) {
      success = false;
    }
    return success;
  }

  Future<bool> createAdvertisement(
      {required String parking,
      required int price,
      required int roomCount,
      required bool status,
      required bool waterSupply,
      required String contact,
      required String description,
      required String location,
      required GeoPoint latlng,
      required String img,
      required bool internet,
      required String residence,
      required bool kitchen}) async {
    Timestamp a = Timestamp.fromMicrosecondsSinceEpoch(
        DateTime.now().microsecondsSinceEpoch);
    Map<String, dynamic> data = {
      "parking": parking,
      "price": price,
      "room_count": roomCount,
      "status": status,
      "water_supply": waterSupply,
      "contact": contact,
      "description": description,
      "location": location,
      "geopoint": latlng,
      "img": img,
      "internet": internet,
      "residence": residence,
      "kitchen": kitchen,
      "user": FirebaseAuth.instance.currentUser?.uid,
      "created": a,
    };
    bool success = true;
    DocumentReference<Map<String, dynamic>>? advertisementsParsable;
    try {
      advertisementsParsable = await FirebaseFirestore.instance
          .collection('Advertisement')
          .add(data)
          .onError((error, stackTrace) {
        throw "error";
      });
    } catch (E) {
      success = false;
    }
    print(advertisementsParsable?.id);
    return success;
  }
}
