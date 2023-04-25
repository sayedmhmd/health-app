import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    required this.child,
    this.color,
    this.disableColor,
    this.elevation,
    this.side = BorderSide.none,
    this.onTap,
    super.key,
  });

  final Widget child;
  final Color? color;
  final Color? disableColor;
  final double? elevation;
  final BorderSide side;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          foregroundColor: color,
          backgroundColor: Colors.black,
          shape: const StadiumBorder().copyWith(side: side),
          disabledBackgroundColor: disableColor ?? Colors.black,
          elevation: elevation,
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
