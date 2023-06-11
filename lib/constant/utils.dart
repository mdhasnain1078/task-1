import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/constant/appColors.dart';

Widget reuseIcon(String svgPath, Color? color){
  return SvgPicture.asset(svgPath, color: color?? AppColor.color.appDarkGrey);
}