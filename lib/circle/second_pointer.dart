import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wave_app/controller/circle_controller.dart';

class SecondPointer extends StatelessWidget {
  SecondPointer({Key? key}) : super(key: key);
  final c = Get.find<CircleController>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isPortait = height > width;
    return RotatedBox(
      quarterTurns: 2,
      child: Transform.rotate(
        angle: c.angle(),
        child: Transform.translate(
          offset: Offset(0, 34),
          child: Center(
            child: Container(
              height: isPortait ? height * 0.15 : height * 0.3,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
