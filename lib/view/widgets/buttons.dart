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
      decoration: const BoxDecoration(
        gradient: blueGradient,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: FilledButton(
        onPressed: onPressed, 
        style: FilledButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: UiColors.overlay,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
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
    return SizedBox(
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          overlayColor: UiColors.overlay,
          shadowColor: Colors.transparent,
          side: const BorderSide(width: 3, color: UiColors.blue50),
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))
        ),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: UiColors.blue50))
      ),
    );
  }
}

class GradientFAB extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const GradientFAB({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed, 
      foregroundColor: Colors.white,
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          gradient: blueGradient,
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: child
      ),
    );
  }
}
