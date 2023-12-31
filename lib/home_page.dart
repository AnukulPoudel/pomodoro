// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:pomodoro/utils/timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(94, 85, 84, 84),
      body: SafeArea(
        child: Padding(
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
                  CustomIcons(icon: Icons.close)
                ],
              ),
              // Space
              SizedBox(
                height: 30,
              ),
              // Timer that ticks
              Center(child: TImerWId()),
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
    );
  }
}

// Custom Icon widget
class CustomIcons extends StatelessWidget {
  IconData? icon;
  double? sizeOfIcon = 30;
  Color? iconColor = Color.fromARGB(255, 148, 148, 148);
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

// Timer
class TImerWId extends StatefulWidget {
  const TImerWId({super.key});

  @override
  State<TImerWId> createState() => _TImerWIdState();
}

class _TImerWIdState extends State<TImerWId> {
  static const maxMinutes = 24;
  static const maxSeconds = 60;
  int minutes = maxMinutes;
  int seconds = maxSeconds;
  bool play = false, canPlay = true;
  Timer? timer;

  void startStopTime() {
    if (play && canPlay) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {
          if (seconds == 1 && minutes == 0) {
            timer!.cancel();
            canPlay = false;
            play = false;
          }
          if (seconds == 1 && minutes > 0) {
            seconds = 60;
            minutes--;
          } else {
            seconds--;
          }
        });
      });
    } else {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress Bar and timer
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color.fromARGB(255, 240, 240, 240))
          ),
          height: 200,
          width: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                // add 1- if you want in opposite direction
                value: seconds / maxSeconds,
                // color: const Color.fromARGB(255, 255, 123, 7),
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation(
                    const Color.fromARGB(255, 255, 123, 7)),
                // backgroundColor: const Color.fromARGB(255, 255, 123, 7),
                strokeCap: StrokeCap.round,
              ),
              // Radius white
              // Container(),
              // Space Timer Text and Session Name(Work etc.)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Little Space above timer
                  SizedBox(
                    height: 20,
                  ),
                  // Timer that ticks
                  Text(
                    '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 227, 227, 227),
                    ),
                  ),
                  // Work or Short Break or LongBreak
                  Text(
                    'WORK',
                    style: TextStyle(
                      color: Color.fromARGB(255, 227, 227, 227),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Space
        SizedBox(
          height: 30,
        ),
        // Buttons that controls the timer (pause and play)
        GestureDetector(
          onTap: () {
            if (canPlay) {
              setState(() {
                {
                  play = (play) ? false : true;
                  startStopTime();
                }
              });
            }
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Color.fromARGB(255, 148, 148, 148),
                width: 3,
              ),
              shape: BoxShape.circle,
              // color: Colors.amber,
            ),
            // Default value of play is flase
            child: (!play)
                ? Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
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
        color: colors ?? Color.fromARGB(255, 148, 148, 148),
        // Color.fromARGB(255, 148, 148, 148),
      ),
    );
  }
}
