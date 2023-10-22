import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/Roots/Route_controller.dart';
import 'package:testmoi/themes/theme.dart';
import 'package:testmoi/utils/data/providers/data_provider.dart';
import 'package:testmoi/utils/data/providers/search_provider.dart';
import 'package:testmoi/utils/data/providers/user_provider.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DataProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRouting.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: "/root",
      theme: AppTheme.lightTheme(context: context)
    );
  }
}
