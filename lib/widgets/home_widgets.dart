import 'package:file_manager/constants/colors.dart';
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

class MiddleSection extends StatelessWidget {
  const MiddleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Text("Internal Storage",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 8,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text("External Storage",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
          ],
        )
      ],
    );
  }
}
