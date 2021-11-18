import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/helpers/shared.dart';

class SElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? style;
  final double elevation;
  final EdgeInsets? padding;
  final Color? primary;
  const SElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style,
    this.elevation = 4,
    this.padding,
    this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        primary: primary ?? colors.lightBlue,
      ),
      child: Container(
        width: double.infinity,
        padding: padding,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style ??
              Get.theme.textTheme.bodyText2!.copyWith(
                color: Colors.white,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}
