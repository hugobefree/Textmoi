import 'package:flutter/material.dart';
import 'package:testmoi/themes/color_light.dart';


class AppTheme{
  static lightTheme({required context}){
    final lightTheme = Theme.of(context).copyWith(
        colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColor.red,
         onPrimary: AppColor.red, secondary: AppColor.blue, onSecondary: AppColor.blue,
         error: AppColor.red, onError: AppColor.red, 
         background: AppColor.background, onBackground: AppColor.background,
          surface: AppColor.white, onSurface: AppColor.white)
    );
    return lightTheme;
  }
}