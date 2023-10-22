import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/Usable/text_define.dart';


class ObjetUserDetails extends StatelessWidget {
  const ObjetUserDetails({
    super.key,
    required this.user, required this.desText, required this.datatext,
  });

  final User user;
  final String desText;
  final String datatext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            desText,
            style: GoogleFonts.poppins(
              fontSize: AppText.p2(context),
              fontWeight: FontWeight.w500,
              color: AppColor.black,
            ),
            softWrap: true,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 9,
          child: Text(
            datatext,
            style: GoogleFonts.poppins(
              fontSize: AppText.p2(context),
              fontWeight: FontWeight.w600,
              color: AppColor.white,
            ),
            softWrap: true,
            textAlign: TextAlign.start,
          ),
        )
      ],
    );
  }
}
