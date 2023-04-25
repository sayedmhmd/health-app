import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave_app/controller/start_controller.dart';
import 'package:wave_app/home_page.dart';
import 'package:sizer/sizer.dart';

class FlutterStopWatch extends StatelessWidget {
  final c = Get.put<StartController>(StartController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() => c.saveTimeStart()),
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder(
            stream: Stream.periodic(
              const Duration(seconds: 1),
            ),
            builder: (context, snapshot) {
              return GetBuilder<StartController>(
                init: Get.put(StartController()),
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Time Usage Application',
                          style: TextStyle(
                            fontSize: 20.0.sp,
                            fontFamily: 'Arial',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            border: Border.all(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Y',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.yearStr} :',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'MO',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.monthStr} :',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'D',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.dayStr} :',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'H',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.hoursStr} :',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'M',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.minutesStr} :',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'S',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  Text(
                                    ' ${controller.secondsStr}',
                                    style: TextStyle(
                                      fontSize: 28.0.sp,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        color: Colors.green[50],
                        child: MaterialButton(
                            onPressed: (() {
                              Get.to(() => HomePage());
                            }),
                            child: Text(
                              'Continue',
                              style: TextStyle(fontSize: 18.sp),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
