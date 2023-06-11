import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/constant/appColors.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton(
      {super.key, required this.svgIconPath, required this.text, required this.color});
  final String svgIconPath;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColor.color.appBlue),
        ),
        child: Row(
          children: [
            SvgPicture.asset(svgIconPath,),
            const SizedBox(
              width: 13,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColor.color.appBlue),
            )
          ],
        ),
      ),
    );
  }
}
