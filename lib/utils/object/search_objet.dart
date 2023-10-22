import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/Usable/text_define.dart';


class SearchObjet extends StatelessWidget {
  const SearchObjet({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        user.picture.contains("http")
            ? CircleAvatar(
                radius: Device.getDeviceScreenWidth(context, 10),
                backgroundImage: NetworkImage(user.picture),
              )
            : CircleAvatar(
                radius: Device.getDeviceScreenWidth(context, 10),
                backgroundImage: FileImage(File(user.picture)),
              ),
        const Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: GoogleFonts.poppins(
                fontSize: AppText.p1(context),
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
              softWrap: true,
              textAlign: TextAlign.start,
            ),
            Text(
              user.phone,
              style: GoogleFonts.poppins(
                fontSize: AppText.p3(context),
                fontWeight: FontWeight.w600,
                color: AppColor.white70,
              ),
              softWrap: true,
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text(
                  user.country,
                  style: GoogleFonts.poppins(
                    fontSize: AppText.p3(context),
                    fontWeight: FontWeight.w600,
                    color: AppColor.white70,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  user.email,
                  style: GoogleFonts.poppins(
                    fontSize: AppText.p3(context),
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
