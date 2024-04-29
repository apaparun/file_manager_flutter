import 'package:file_manager/constants/colors.dart';
import 'package:file_manager/widgets/home_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: deviceheight,
        child: Stack(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height / 1.5),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(70))),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    color: AppColors.backgroundColor,
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height / 3),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70))),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: deviceheight,
                child: const Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TopBar(),
                    SizedBox(
                      height: 50,
                    ),
                    TopHeading(),
                    MiddleSection()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
