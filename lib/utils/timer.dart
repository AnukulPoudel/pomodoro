import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$seconds'),
    );
  }
}
