import 'package:flutter/material.dart';

class AppBtn extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? color;

  const AppBtn(
      {super.key, required this.child, this.onTap, this.style, this.color});

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        height: mHeight * 0.06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
