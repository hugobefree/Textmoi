import 'package:flutter/material.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/Usable/Radieus_Def.dart';
import 'package:testmoi/utils/object/search_objet.dart';

// ici j'appel les obejt de la recherche en fonction de la recherche effectuée

class SearchCard extends StatelessWidget {
  const SearchCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Device.getScreenWidth(context),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: Device.getDeviceScreenHeight(context, 10),
      decoration: BoxDecoration(
        borderRadius: AppRadius.radius10,
        color: AppColor.black,
      ),
      child: SearchObjet(user: user),
    );
  }
}
