import 'package:flutter/cupertino.dart';
import 'package:testmoi/views/Add_New_User.dart';
import 'package:testmoi/views/NavigationButton.dart';
import 'package:testmoi/views/add_user_screen.dart';
import 'package:testmoi/views/favorite_screen.dart';
import 'package:testmoi/views/home_screen.dart';
import 'package:testmoi/views/search_screen.dart';


class AppRouting {
  static Map<String, Widget Function(BuildContext)> routes = {
    "/root": (_) => const NavigationButton(),
    "/add": (_) => const AddUserScreen(),
    "/update": (_) => const AddNewUser(),
  };
  static List<Widget> listOfScreen = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
  ];
}
