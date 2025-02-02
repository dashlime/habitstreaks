import 'package:flutter/material.dart';
import 'package:habitstreaks/view/effects/drop_shadow_effect.dart';

class UiCard extends StatelessWidget {
  final Widget child;

  const UiCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: DropShadowEffect(
        offset: const Offset(1, 1),
        blur: 4,
        spread: 3,
        borderRadius: 20,
        alpha: 12,
        child: Card(
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 0,
          child: child,
        ),
      )
    );
  }
}