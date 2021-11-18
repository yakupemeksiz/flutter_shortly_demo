import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/shared.dart';

class IntroductionCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String svgUrl;
  const IntroductionCardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.svgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: dimen.widthFactor * 85,
          margin: EdgeInsets.only(top: dimen.heightFactor * 6.5),
          padding: EdgeInsets.only(
            top: dimen.heightFactor * 8,
            bottom: dimen.heightFactor * 4,
            left: dimen.widthFactor * 7,
            right: dimen.widthFactor * 7,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.theme.textTheme.headline5,
              ),
              SizedBox(height: dimen.heightFactor * 2),
              Text(
                description,
                style: Get.theme.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          height: dimen.widthFactor * 27,
          width: dimen.widthFactor * 27,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.blueMagenta,
          ),
          child: Padding(
            padding: EdgeInsets.all(dimen.widthFactor * 6.5),
            child: SvgPicture.asset(
              svgUrl,
              color: colors.lightBlue,
            ),
          ),
        )
      ],
    );
  }
}
