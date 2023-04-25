import 'package:flutter/material.dart';
import 'package:wave_app/circle/analogic_circle.dart';
import 'package:wave_app/circle/second_pointer.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: Stream.periodic(
              const Duration(seconds: 1),
            ),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnalogicCircle(),
                      SecondPointer(),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
