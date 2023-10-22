import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/models/user.dart';
import 'package:testmoi/utils/Usable/text_define.dart';

class CostumCardText extends StatelessWidget {
  const CostumCardText({
    super.key,
    required this.user,
    required this.custumtext,
  });

  final User user;
  final String custumtext;

  @override
  Widget build(BuildContext context) {
    return Text(
      custumtext,
      style: GoogleFonts.poppins(
        fontSize: AppText.p3(context),
        fontWeight: FontWeight.w600,
        color: AppColor.white,
      ),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
