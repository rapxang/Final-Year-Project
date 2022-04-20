import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  String name;
  IconData icon;
  Category({required this.name, required this.icon});
}
List<Category>categories = [
  Category(
    name: 'House',
    icon: FontAwesomeIcons.houseUser,
  ),
  Category(
    name: 'Room',
    icon: FontAwesomeIcons.houseUser,
  ),
];