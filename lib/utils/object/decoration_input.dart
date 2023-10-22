import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/Usable/text_define.dart';


inputDecorationGrey({required hint, required context, required radius}) {
  return InputDecoration(
    filled: true,
    fillColor: AppColor.black12,
    hintText: '$hint',
    hintStyle: GoogleFonts.poppins(
        color: AppColor.black54,
        fontWeight: FontWeight.w600,
        fontSize: AppText.p2(context)),
    contentPadding: const EdgeInsets.all(8),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.red.withOpacity(0.7), width: 2),
      borderRadius: radius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: radius,
    ),
  );
}
