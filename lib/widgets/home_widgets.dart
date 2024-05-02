import 'package:file_manager/constants/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        // child: Image.asset(''),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const ProfileIcon()
        ],
      ),
    );
  }
}

class TopHeading extends StatelessWidget {
  const TopHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "File",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Manager",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                RichText(
                  text: const TextSpan(
                      text: "Let's clean and ",
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                            text: "manage your file's.",
                            style: TextStyle(color: Colors.amber))
                      ]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MiddleSection extends StatefulWidget {
  const MiddleSection({super.key});

  @override
  State<MiddleSection> createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 3,
                child: Text("Internal Storage",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 45,
                  height: 4,
                ),
                Container(
                  color: Colors.white,
                  width: 8,
                  height: 8,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 3,
                child: Text("External Storage",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
        const Spacer(),
        SizedBox(
          width: (MediaQuery.of(context).size.width / 1.5),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 30,
                bottom: 30,
                child: Container(
                  width: (MediaQuery.of(context).size.width / 2) - 20,
                  height: (MediaQuery.of(context).size.height / 2.5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width / 1.5) - 20,
                height: (MediaQuery.of(context).size.height / 2),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Your Storage",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        children: [
                          PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                  });
                                },
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              startDegreeOffset: -90,
                              sectionsSpace: 8,
                              centerSpaceRadius: 60,
                              sections: showingSections(),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            right: 0,
                            left: 0,
                            child: Column(
                              children: [
                                RichText(
                                  textAlign: TextAlign.end,
                                  text: const TextSpan(
                                      text: "128",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: "GB",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ]),
                                ),
                                const Text(
                                  "70% USED",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                            Text("Used")
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 208, 50, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                            Text("Free")
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer()
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (index) {
      final isTouched = index == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Colors.white,
            value: 70,
            title: "",
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.secondaryColor,
            value: 40,
            title: "",
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}
