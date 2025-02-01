import 'package:flutter/material.dart';
import 'package:habitstreaks/view/theme/colors.dart';

class GradientFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientFilledButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: blueGradient,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: FilledButton(
        onPressed: onPressed, 
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: Color(0x01000000),
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
        ),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white))
      ),
    );
  }
}

class GradientOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientOutlinedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: Color(0x01000000),
          shadowColor: Colors.transparent,
          side: BorderSide(width: 3, color: UiColors.blue50),
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
        ),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: UiColors.blue50))
      ),
    );
  }
}