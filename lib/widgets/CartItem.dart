import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../constant/appColors.dart';
import '../model/cart.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return 
    Card(
      // elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 240,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(cart.imagePath),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart.category,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.color.appBlue)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(cart.name,
                  overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 15,
                  ),
                  if (cart.isLocked == true)
                    Text("${cart.lessons} Lessons",
                        style: Theme.of(context).textTheme.bodySmall),
                  
                  if (cart.isLocked == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("3 min",
                            style: Theme.of(context).textTheme.bodySmall),
                        SvgPicture.asset("assets/svg/lock.svg",
                            color: AppColor.color.appDarkGrey)
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
