import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/Roots/Route_controller.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/providers/data_provider.dart';


class NavigationButton extends StatefulWidget {
  const NavigationButton({super.key});

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int currentIndex = 0;
  bool isNewClient = true;

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).setUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: const Text(
          'Bienvenue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: AppRouting.listOfScreen[currentIndex],
        ),
      ),
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorites',
          ),
        ],
        selectedIndex: currentIndex,
        onTabChange: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
