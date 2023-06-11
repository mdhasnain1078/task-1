import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/screen/messageScreen.dart';
import 'package:task1/widgets/reusableButton.dart';

import '../constant/appColors.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 32),
      color: AppColor.color.appLightBlue,
      width: double.maxFinite,
      // height:
      //     // hieght * 0.4
      //     276,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  const Drawer();
                  },
                child: SvgPicture.asset("assets/svg/menu.svg")),
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MessageScreen())),
                    child: SvgPicture.asset("assets/svg/message.svg")),
                  const SizedBox(
                    width: 22,
                  ),
                  SvgPicture.asset("assets/svg/notification.svg"),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            "Hello, Priya!",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            "What do you wanna learn today?",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.color.appDarkGrey),
          ),
          const SizedBox(
            height: 32,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableButton(
                    svgIconPath: "assets/svg/programs.svg",
                    text: "Programs",
                    color: AppColor.color.appBlue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ReusableButton(
                    svgIconPath: "assets/svg/gethelp.svg",
                    text: "Get help",
                    color: AppColor.color.appBlue,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableButton(
                    svgIconPath: "assets/svg/learnboldblue.svg",
                    text: "Learn",
                    color: AppColor.color.appBlue,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ReusableButton(
                    svgIconPath: "assets/svg/tracker.svg",
                    text: "DD Tracker",
                    color: AppColor.color.appBlue,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
