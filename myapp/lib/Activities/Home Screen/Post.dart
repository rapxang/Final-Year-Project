import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Services/AdvertisementService.dart';
import '../../model/advertisement_model.dart';
import 'IndividualPost.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FutureBuilder(
          future: AdvertisementService().getAdvertisements(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Advertisement> advertisements = snapshot.data;
              advertisements.sort((b, a) => a.created.compareTo(b.created));
              return ListView(
                children: advertisements
                    .map(
                      (e) => IndividualPost(e),
                    )
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
