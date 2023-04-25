import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wave_app/wave/sine_curve.dart';

class WaveController extends GetxController {
  static final linearTween = Tween<double>(begin: 0, end: .5);
  final Animatable<double> _mainCurve =
      linearTween.chain(CurveTween(curve: const SineCurve()));
  Animatable<double>? _compareCurve;
  final double _size = 91.w;
  double get size => _size;
  final Duration _duration = const Duration(seconds: 11);
  final KindOfAnimation _kindOfAnim = KindOfAnimation.repeat;
  late AnimationController controller;
  Animatable<double> get mainCurve => _mainCurve;
  Animatable<double>? get compareCurve => _compareCurve;

  Duration get duration => _duration;
  KindOfAnimation get kindOfAnim => _kindOfAnim;
  late Path shadowPath;
  Path? comparePath;

  @override
  // TODO: implement onDelete

  @override
  void onClose() async {
    super.onClose();
    controller.dispose();
  }

  Path buildGraph(Animatable<double> animatable) {
    var val = 0.0;
    var path = Path();
    for (var t = 0.0; t <= 1; t += 0.01) {
      val = -animatable.transform(t) * size;
      path.lineTo(t * size, val);
    }
    update();
    return path;
  }

  playAnimation() {
    if (controller.stop == true) {
      controller.forward();
    }
    controller.forward();
    if (_kindOfAnim == KindOfAnimation.forward) {
      controller.forward();
    } else if (_kindOfAnim == KindOfAnimation.repeat) {
      controller.repeat();
    } else {
      controller.repeat(reverse: true);
    }
    update();
  }

  stopAnimation() {
    controller.stop();
    if (_kindOfAnim == KindOfAnimation.forward) {
      controller.stop();
    } else if (_kindOfAnim == KindOfAnimation.repeat) {
      controller.stop();
    } else {
      controller.repeat(reverse: true);
    }
    update();
  }

  resetAnimation() {
    controller.reset();
    if (_kindOfAnim == KindOfAnimation.forward) {
      controller.reset();
    } else if (_kindOfAnim == KindOfAnimation.repeat) {
      controller.reset();
    } else {
      controller.repeat(reverse: true);
    }
    update();
  }
}
