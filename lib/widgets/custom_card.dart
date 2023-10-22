// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/data/providers/data_provider.dart';
import 'package:testmoi/utils/Usable/Radieus_Def.dart';
import 'package:testmoi/utils/Usable/text_define.dart';
import 'package:testmoi/utils/object/Custom_card_text.dart';
import 'package:testmoi/utils/object/Details_objet.dart';
import 'package:testmoi/widgets/button/primary_button.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: AppRadius.radius20,
      child: Container(
        width: Device.getScreenWidth(context) * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: Device.getScreenHeight(context) * 0.25,
        decoration:
            BoxDecoration(borderRadius: AppRadius.radius20, color: Colors.pink),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 5,
              child: InkWell(
                onTap: () {
                  final RenderBox overlay = Overlay.of(context)
                      .context
                      .findRenderObject() as RenderBox;
                  final RenderBox cardBox =
                      context.findRenderObject() as RenderBox;
                  final Offset position =
                      cardBox.localToGlobal(Offset.zero, ancestor: overlay);
                  showMenu(
                      position: RelativeRect.fromLTRB(
                        position.dx + 50,
                        position.dy,
                        position.dx + cardBox.size.width - 20,
                        position.dy + cardBox.size.height,
                      ),
                      color: AppColor.white.withOpacity(0.9),
                      elevation: 3,
                      constraints:
                          const BoxConstraints(maxWidth: 120, maxHeight: 120),
                      context: context,
                      items: [
                        PopupMenuItem(
                          onTap: () async {
                            Provider.of<DataProvider>(context, listen: false)
                                .removeUser(user);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "sup",
                                style: GoogleFonts.poppins(
                                  fontSize: AppText.titre4(context),
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.red,
                                ),
                              ),
                              Icon(
                                Icons.delete,
                                color: AppColor.red,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ]);
                },
                child: Icon(
                  Icons.delete,
                  color: AppColor.white,
                  size: 30,
                ),
              ),
            ),
            Positioned(
              left: 5,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    await Provider.of<DataProvider>(context, listen: false)
                        .likeUser(user);
                  },
                  child: FaIcon(
                    color: user.favorite ? AppColor.blue : AppColor.white70,
                    FontAwesomeIcons.solidHeart,
                    size: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Device.getScreenWidth(context),
              height: Device.getScreenHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  user.picture.contains("http")
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user.picture),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage: FileImage(File(user.picture)),
                        ),
                  Gap(Device.getDeviceScreenWidth(context, 20)),
                  CostumCardText(
                    user: user,
                    custumtext: user.name,
                  ),
                  CostumCardText(
                    user: user,
                    custumtext: user.phone,
                  ),
                  CostumCardText(
                    user: user,
                    custumtext: user.country,
                  ),
                  Gap(Device.getDeviceScreenWidth(context, 50)),
                  PrimaryButton(
                    elevation: 2,
                    width: Device.getDeviceScreenWidth(context, 4),
                    height: Device.getDeviceScreenHeight(context, 25),
                    radius: AppRadius.radius50,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DetailsObject(user: user);
                          });
                    },
                    color: Colors.black,
                    child: Text(
                      "Details",
                      style: GoogleFonts.poppins(
                        fontSize: AppText.p2(context),
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
