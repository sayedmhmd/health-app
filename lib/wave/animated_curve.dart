import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_app/controller/wave_controller.dart';
import 'package:wave_app/wave/graph_painter.dart';

class AnimationAndCurve extends StatefulWidget {
  const AnimationAndCurve({super.key});

  @override
  AnimationAndCurveState createState() => AnimationAndCurveState();
}

class AnimationAndCurveState extends State<AnimationAndCurve>
    with SingleTickerProviderStateMixin {
  final contr = Get.put(WaveController());
  @override
  void initState() {
    super.initState();
    contr.controller = AnimationController(
      vsync: this,
      duration: contr.duration,
    );
    contr.shadowPath = contr.buildGraph(contr.mainCurve);
    if (contr.compareCurve != null) {
      contr.comparePath = contr.buildGraph(contr.compareCurve!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // bool isPortait = height > width;
    var intervalValue = 0.0;
    var followPath = Path();
    return SizedBox(
      height: height * .3,
      //width: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedBuilder(
            animation: contr.controller,
            builder: (_, child) {
              // rest the follow path when the controller is finished
              if (intervalValue >= contr.controller.value) {
                followPath.reset();
              }
              intervalValue = contr.controller.value;

              final val = contr.mainCurve.evaluate(contr.controller);
              followPath.lineTo(
                  contr.controller.value * contr.size, -val * contr.size);

              return CustomPaint(
                painter: GraphPainter(
                  shadowPath: contr.shadowPath,
                  followPath: followPath,
                  comparePath: contr.comparePath,
                  currentPoint: Offset(
                    contr.controller.value * contr.size,
                    val * contr.size,
                  ),
                  graphSize: contr.size - 2,
                ),
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
