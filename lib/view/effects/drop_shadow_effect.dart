import 'package:flutter/material.dart';

class DropShadowEffect extends StatelessWidget {
  final Widget child;
  final double blur;
  final double spread;
  final Offset offset;
  final int alpha;
  final double borderRadius;

  const DropShadowEffect({super.key, required this.child, this.blur = 4, this.spread = 0, this.offset = const Offset(0, -2), this.alpha = 25, this.borderRadius = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0x00000000).withAlpha(alpha),
              blurRadius: blur,
              spreadRadius: spread,
              offset: offset
          )
        ],
      ),
      child: child
    );
  }
}