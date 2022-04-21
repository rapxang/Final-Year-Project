import 'package:flutter/material.dart';
import 'package:myapp/Activities/Search/SearchScreen.dart';

import '../Advertisement/add_product.dart';
import '../Drawer/appDrawer.dart';
import 'Post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  PageController controller = PageController();

  changeScreen(int i) {
    setState(() {
      index = i;
    });
    controller.animateToPage(i,
        duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            index == 1
                ? 'Advertise Your Residence'
                : index == 0
                    ? "Your Posts"
                    : "Search for other residences",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int i) {
            controller.animateToPage(i,
                duration: const Duration(milliseconds: 200), curve: Curves.easeIn);

            setState(() {
              index = i;
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "My Posts",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.create,
              ),
              label: "Create",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search",
            ),
          ],
        ),
        backgroundColor: const Color(0xfff2f2f2),
        body: PageView(
          onPageChanged: (int i) {
            setState(() => index = i);
          },
          controller: controller,
          children: [
            Post(changeScreen),
            Advertise(changeScreen),
            SearchScreen(),
          ],
        ),
      ),
    );
  }
}
