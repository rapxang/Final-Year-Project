import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 1;
  PageController controller = PageController();
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
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (int i) {
                  setState(() => index = i);
                },
                controller: controller,
                children: [
                  Container(
                    color: Colors.red,
                  ),
                  isSearching
                      ? Column(
                          children: [
                            Container(
                              child: Row(children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    setState(() {
                                      isSearching = !isSearching;
                                    });
                                  },
                                ),
                              ]),
                            ),
                            selected.isEmpty
                                ? Expanded(
                                    child: Center(
                                      child: Text("No Results"),
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
                                            margin: EdgeInsets.all(12),
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 2),
                                                    spreadRadius: 1,
                                                    blurRadius: 4,
                                                    color: Colors.black
                                                        .withOpacity(0.1))
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
                              margin: EdgeInsets.all(12),
                              width: double.infinity,
                              height: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                  prefixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Location",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
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
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeIn,
                                          margin: EdgeInsets.all(6),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: selected.contains(e.key)
                                                ? Colors.green
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(0, 2),
                                                  spreadRadius: 1,
                                                  blurRadius: 4,
                                                  color: Colors.black
                                                      .withOpacity(0.1))
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
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              height: 1,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Residence Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.5),
                              height: 1,
                              width: double.infinity,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() => isSearching = !isSearching);
                              },
                              child: Container(
                                margin: EdgeInsets.all(12),
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        color: Colors.black.withOpacity(0.1))
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "GO",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      spreadRadius: 3,
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.1))
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.previousPage(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.create,
                            color: index == 0
                                ? Colors.green
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.nextPage(
                            duration: Duration(
                              milliseconds: 200,
                            ),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.search,
                            color: index == 1
                                ? Colors.green
                                : Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
