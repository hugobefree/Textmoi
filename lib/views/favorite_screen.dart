import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/widgets/custom_card.dart';

import '../utils/data/providers/data_provider.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Consumer<DataProvider>(builder: (context, dataProvider, child) {
        return GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
              childAspectRatio: Device.getScreenHeight(context)*0.00095,
              mainAxisSpacing: Device.getDeviceScreenHeight(context,45),
              crossAxisSpacing: Device.getDeviceScreenWidth(context,25)),
          itemCount: dataProvider.users
              .where((user) => user.favorite == true)
              .toList()
              .length,
          itemBuilder: (context, index) {
            final user = dataProvider.users
                .where((user) => user.favorite == true)
                .toList()[index];
            return CustomCard(user: user);
          },
        );
      }),
    );
  }
}
