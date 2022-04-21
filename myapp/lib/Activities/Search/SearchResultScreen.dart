import 'package:flutter/material.dart';
import 'package:myapp/model/advertisement_model.dart';

import '../Home Screen/IndividualPost.dart';

class SearchResultScreen extends StatelessWidget {
  final List<Advertisement> advertisements;

  SearchResultScreen(this.advertisements);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        "Search Results",
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: advertisements.isEmpty
            ? Center(
                child: Text(
                  "No Search Results..",
                ),
              )
            : ListView(
                children: advertisements
                    .map(
                      (e) => IndividualPost(e, () {}, () {}, isEditable: false),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
