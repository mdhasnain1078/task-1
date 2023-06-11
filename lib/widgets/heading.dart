import 'package:flutter/material.dart';

import '../constant/appColors.dart';

class ListHeading extends StatelessWidget {
  const ListHeading({
    super.key, required this.title,
  });

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Row(children: [
                Text("View all", style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: AppColor.color.appDarkGrey),),
                    const SizedBox(width: 7,),
                    Icon(Icons.arrow_forward, size: 15, color: AppColor.color.appDarkGrey),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}