import 'package:flutter/material.dart';
import 'package:wave_app/circle/clock_view.dart';
import 'package:wave_app/circle/stopwatch.dart';
import 'package:wave_app/wave/animated_curve.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isPortait = height < width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 250, 250),
        body: OrientationBuilder(builder: (context, _) {
          return isPortait
              ? const OrientationLandscape()
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        const ClockView(),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: height * .02, horizontal: height * .2),
                          child: const AnimationAndCurve(),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: height * .25,
                          child: StopWatch(),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}

class OrientationLandscape extends StatelessWidget {
  const OrientationLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: width * .007, top: width * .007),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: width * .33,
                  margin: EdgeInsets.only(
                    right: width * .02,
                    left: width * .01,
                  ),
                  child: const ClockView(),
                ),
                SizedBox(
                  width: width * .32,
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: AnimationAndCurve(),
                  ),
                ),
                Container(
                  width: width * .25,
                  child: StopWatch(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
