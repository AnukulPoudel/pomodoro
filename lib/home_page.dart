// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/utils/timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(94, 85, 84, 84),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
            width: 400,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Custom Title or AppBar whatever you wanna call it
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIcons(icon: Icons.sort),
                    const Text(
                      'Pomodoro Timer',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          SystemNavigator.pop();
                        },
                        child: CustomIcons(icon: Icons.close))
                  ],
                ),
                // Space
                const SizedBox(
                  height: 30,
                ),
                // Timer that ticks
                const Center(child: TImerWId()),
                // Last Row of widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Reset Buttom and Rounds Info
                    Column(
                      children: [
                        CustomText(
                          text: '2/4',
                          colors: Colors.white,
                        ),
                        GestureDetector(
                            onTap: () {}, child: CustomText(text: 'Reset')),
                      ],
                    ),
                    Row(
                      children: [
                        CustomIcons(icon: Icons.skip_next),
                        CustomIcons(icon: Icons.volume_up),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Icon widget
class CustomIcons extends StatelessWidget {
  IconData? icon;
  double? sizeOfIcon = 30;
  Color? iconColor = const Color.fromARGB(255, 148, 148, 148);
  CustomIcons({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: sizeOfIcon,
      color: iconColor,
    );
  }
}

// Custom Text Wideget
class CustomText extends StatelessWidget {
  String text;
  Color? colors;
  CustomText({super.key, this.colors, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colors ?? const Color.fromARGB(255, 148, 148, 148),
        // Color.fromARGB(255, 148, 148, 148),
      ),
    );
  }
}
