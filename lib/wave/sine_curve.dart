import 'dart:math';

import 'package:flutter/material.dart';

class SineCurve extends Curve {
  const SineCurve({this.count = 1});

  final double count;

  // t = x =1
  @override
  double transformInternal(double t) {
    // var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    var val = sin(2 * pi * t) * 0.5;
    return val; //f(x)
  }
}

enum KindOfAnimation {
  forward,
  repeat,
  repeatAndreverse,
}
