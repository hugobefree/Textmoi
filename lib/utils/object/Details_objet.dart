import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/Usable/Radieus_Def.dart';
import 'package:testmoi/utils/Usable/text_define.dart';
import 'package:testmoi/utils/object/objet_User_detail.dart';

class DetailsObject extends StatelessWidget {
  const DetailsObject({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: user.picture.contains("http")
            ? TransparentImageCard(
                borderRadius: 20,
                contentMarginTop: Device.getScreenHeight(context) * 0.2,
                tags: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: AppRadius.radius10, color: Colors.black),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "${user.city}, ${user.country}",
                      style: GoogleFonts.poppins(
                        fontSize: AppText.p2(context),
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
                description: Column(
                  children: [
                    ObjetUserDetails(
                      user: user,
                      desText: 'phone',
                      datatext: user.phone,
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'Email', datatext: user.email),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'Gender', datatext: user.gender),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user,
                        desText: 'Birthday :',
                        datatext: user.birthday),
                    ObjetUserDetails(
                        user: user, desText: 'Street:', datatext: user.street),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'City', datatext: user.city),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'State', datatext: user.state),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                  ],
                ),
                title: Text(
                  user.name.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: AppText.titre3(context),
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                imageProvider: NetworkImage(user.picture),
                width: Device.getScreenWidth(context),
                height: Device.getScreenHeight(context) * 0.6,
              )
            : TransparentImageCard(
                borderRadius: 20,
                contentMarginTop: Device.getScreenHeight(context) * 0.2,
                tags: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: AppRadius.radius10, color: AppColor.blue),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "${user.city}, ${user.country}",
                      style: GoogleFonts.poppins(
                        fontSize: AppText.p2(context),
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
                description: Column(
                  children: [
                    ObjetUserDetails(
                      user: user,
                      desText: 'phone',
                      datatext: user.phone,
                    ),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'Email', datatext: user.email),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'Gender', datatext: user.gender),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user,
                        desText: 'Birthday :',
                        datatext: user.birthday),
                    ObjetUserDetails(
                        user: user, desText: 'Street:', datatext: user.street),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'City', datatext: user.city),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                    ObjetUserDetails(
                        user: user, desText: 'State', datatext: user.state),
                    Gap(Device.getDeviceScreenHeight(context, 150)),
                  ],
                ),
                title: Text(
                  user.name.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: AppText.titre2(context),
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                imageProvider: FileImage(File(user.picture)),
                width: Device.getScreenWidth(context),
                height: Device.getScreenHeight(context) * 0.6,
              ));
  }
}
