import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/shared.dart';

class ShortenEmptyHistoryWidget extends StatelessWidget {
  final String logoSvgUrl;
  final String illustrationSvgUrl;
  final String title;
  final String description;

  const ShortenEmptyHistoryWidget({
    Key? key,
    required this.logoSvgUrl,
    required this.illustrationSvgUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dimen.heightFactor * 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Align(child: SvgPicture.asset(logoSvgUrl)),
          ),
          SizedBox(height: dimen.heightFactor * 2),
          Expanded(
              flex: 9,
              child: SvgPicture.asset(illustrationSvgUrl,
                  alignment: Alignment.topRight)),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: dimen.widthFactor * 20,
                  vertical: dimen.heightFactor * 2),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Get.theme.textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: dimen.heightFactor / 2),
                  Text(
                    description,
                    style: Get.theme.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
