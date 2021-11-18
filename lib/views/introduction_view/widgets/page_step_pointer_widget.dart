import 'package:flutter/material.dart';
import '../../../utils/helpers/shared.dart';

class PageStepPointerWidget extends StatelessWidget {
  final Color contentColor;
  final Color borderColor;

  const PageStepPointerWidget({
    Key? key,
    required this.contentColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.fastOutSlowIn,
      margin: EdgeInsets.only(right: dimen.widthFactor * 4),
      height: dimen.widthFactor * 2,
      width: dimen.widthFactor * 2,
      decoration: BoxDecoration(
        color: contentColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
        ),
      ),
    );
  }
}
