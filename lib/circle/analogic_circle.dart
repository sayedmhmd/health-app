import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wave_app/controller/circle_controller.dart';

class AnalogicCircle extends StatelessWidget {
  final controller = Get.find<CircleController>();

  AnalogicCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isPortait = height > width;
    return GestureDetector(
      onTap: controller.handleModeSelected,
      child: Padding(
        padding: EdgeInsets.all(
          isPortait ? 6.0 : 0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: isPortait ? 0 : 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '11',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  controller.text1.toString(),
                  style: TextStyle(
                      color: controller.isColor
                          ? Colors.yellowAccent
                          : Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(239, 0, 0, 0),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  controller.text2.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '5.5',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27.sp,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
