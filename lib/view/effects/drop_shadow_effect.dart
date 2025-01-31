import 'package:flutter/material.dart';

class DropShadowEffect extends StatelessWidget {
  final Widget child;

  const DropShadowEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 4,
              offset: Offset(0.0, -2)
          )
        ],
      ),
      child: child
    );
  }
}