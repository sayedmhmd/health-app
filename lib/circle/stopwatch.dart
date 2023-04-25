import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:wave_app/controller/wave_controller.dart';
import 'package:wave_app/model/rounded_button.dart';

import '../wave/animated_curve.dart';

class StopWatch extends StatefulWidget {
  // final Function start;
  // final Function stop;
  // final Function reset;
  // const StopWatch(
  //     {required this.start, required this.stop, required this.reset});
  @override
  _State createState() => _State();
}

class _State extends State<StopWatch> {
  // final _isHours = true;

  final c = Get.find<WaveController>();

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  bool isNamed = false;
  String _buttonText = 'Start';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isPortait = height > width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isPortait ? 0 : 0,
        horizontal: isPortait ? 16 : 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /// Display stop watch time
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime = StopWatchTimer.getDisplayTime(value,
                  hours: false, minute: false, secondRightBreak: ":");
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: TextStyle(
                        fontSize: isPortait ? 60.sp : 50.sp,
                        fontFamily: 'DS-Digital',
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          /// Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5),
                width: 12.w,
                height: 12.w,
                child: RoundedButton(
                  color: Colors.black,
                  onTap: (() {
                    if (isNamed == false) {
                      _stopWatchTimer.onStartTimer();
                      c.playAnimation();
                      // widget.start();
                      // andCurve!.playAnimation(context);
                    } else if (isNamed == true) {
                      _stopWatchTimer.onStopTimer();
                      c.stopAnimation();
                      // widget.stop();
                      // andCurve!.stopAnimation();
                    } else {}

                    setState(() {
                      isNamed = !isNamed;
                      _buttonText = isNamed ? 'Stop' : 'Start';
                    });
                  }),
                  child: Text(
                    _buttonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Arial',
                        fontSize: 15.sp),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.all(5),
                width: 12.w,
                height: 12.w,
                child: RoundedButton(
                  color: Colors.black,
                  onTap: (() {
                    _stopWatchTimer.onResetTimer();
                    // widget.reset();
                    //andCurve!.resetAnimation();
                    c.resetAnimation();
                  }),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Arial',
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              // _startButton,
              // _resetButton
            ],
          ),
        ],
      ),
    );
  }

  late final Widget _startButton = Container(
    margin: const EdgeInsets.all(5),
    width: 12.w,
    height: 12.w,
    child: RoundedButton(
      color: Colors.black,
      onTap: (() {
        if (isNamed == false) {
          _stopWatchTimer.onStartTimer();
          // widget.start();
          c.playAnimation();
        } else if (isNamed == true) {
          _stopWatchTimer.onStopTimer();
          //widget.stop();
          c.stopAnimation();
        } else {}

        setState(() {
          isNamed = !isNamed;
        });
      }),
      child: Text(
        isNamed ? 'Stop' : 'Start',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Arial',
          fontSize: 15.sp,
        ),
      ),
    ),
  );

  late final Widget _resetButton = Container(
    margin: const EdgeInsets.all(5),
    width: 12.w,
    height: 12.w,
    child: RoundedButton(
      color: Colors.black,
      onTap: (() {
        _stopWatchTimer.onResetTimer();
        //  widget.reset();
        c.resetAnimation();
      }),
      child: Text(
        'Reset',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Arial',
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}
