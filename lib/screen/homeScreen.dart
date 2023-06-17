import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/provider/carts.dart';
import 'package:task1/widgets/vertical_list.dart';
import '../widgets/header.dart';
import '../widgets/heading.dart';
import '../widgets/vertical_list_of_lesson_event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.normal),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Header(),
              const SizedBox(
                height: 24,
              ),
              FutureBuilder(
                future: Provider.of<Carts>(context).getData1(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Consumer<Carts>(
                            builder: (context, carts, child) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ListHeading(
                                      title: "Programs for you",
                                    ),
                                    VerticalList(
                                      carts: carts.programList,
                                    ),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    const ListHeading(
                                      title: "Events and experiences",
                                    ),
                                    VerticalListOfEventsexperiences(
                                        carts: carts.eventList),
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    const ListHeading(
                                      title: "Lessons for you",
                                    ),
                                    VerticalList(carts: carts.lockLessonsList),
                                  ],
                                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
