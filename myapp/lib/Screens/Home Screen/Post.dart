import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/Services/AdvertisementService.dart';

import '../../model/advertisement_model.dart';

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
              return ListView(
                children: advertisements
                    .map(
                      (e) => Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, -2),
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 126,
                                width: 126,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(e.img),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.contact,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.home),
                                        Expanded(
                                          child: Text(
                                            e.residence,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(Icons.location_on_rounded),
                                        Expanded(
                                          child: Text(
                                            e.location,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        e.kitchen ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.set_meal_rounded),
                                            ),
                                          ),
                                        ): Container(),
                                        e.internet ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.wifi),
                                            ),
                                          ),
                                        ): Container(),
                                        e.waterSupply ? Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(
                                                  Icons.water_damage_outlined,),
                                            ),
                                          ),
                                        ): Container(),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      e.description,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
