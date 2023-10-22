import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/providers/data_provider.dart';
import 'package:testmoi/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Consumer<DataProvider>(builder: (context, dataProvider, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dataProvider.users.length,
          itemBuilder: (context, index) {
            final user =
                dataProvider.users[index]; // Use the index to access the item
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomCard(user: user),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        elevation: 5,
        child: Icon(
          Icons.person,
          color: AppColor.white,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
      ),
    );
  }
}
