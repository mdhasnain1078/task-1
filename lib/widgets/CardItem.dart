import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Card(
      // elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 240,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(cart.imagePath),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 15, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.color.appBlue)),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(cart.description,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 15,
                  ),
                  if (cart.category == Category.program)
                    Text("${cart.lessons} Lessons",
                        style: Theme.of(context).textTheme.bodySmall),
                  if (cart.category == Category.event)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(cart.dateTime,
                            style: Theme.of(context).textTheme.bodySmall),
                        InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Your Lesson is booked"),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1, color: AppColor.color.appBlue),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 5),
                              child: Text(
                                "Book",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColor.color.appBlue),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  if (cart.category == Category.lesson)
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
