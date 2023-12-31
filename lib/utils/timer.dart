import 'dart:async';
import 'package:flutter/material.dart';

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
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
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
                valueColor: const AlwaysStoppedAnimation(
                    Color.fromARGB(255, 255, 123, 7)),
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
                  const SizedBox(
                    height: 20,
                  ),
                  // Timer that ticks
                  Text(
                    '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 227, 227, 227),
                    ),
                  ),
                  // Work or Short Break or LongBreak
                  const Text(
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
        const SizedBox(
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
                color: const Color.fromARGB(255, 148, 148, 148),
                width: 3,
              ),
              shape: BoxShape.circle,
              // color: Colors.amber,
            ),
            // Default value of play is flase
            child: (!play)
                ? const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
          ),
        ),
      ],
    );
  }
}
