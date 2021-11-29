import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/shared.dart';
import '../../../widgets/s_elevated_button.dart';

class HistoryWidget extends StatelessWidget {
  final String lastUrl;
  final String shortenUrl;
  final void Function()? onDeleted;
  final void Function()? onPressed;
  final Color? primary;
  final String buttonText;
  const HistoryWidget({
    Key? key,
    required this.lastUrl,
    required this.shortenUrl,
    required this.buttonText,
    this.onDeleted,
    this.onPressed,
    this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: dimen.widthFactor * 5,
            left: dimen.widthFactor * 5,
            right: dimen.widthFactor * 5,
          ),
          padding: EdgeInsets.all(dimen.widthFactor * 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: dimen.widthFactor * 4,
                    vertical: dimen.widthFactor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: dimen.widthFactor * 60,
                      child: Text(
                        lastUrl,
                        style: Get.theme.textTheme.bodyText2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onDeleted,
                      child: SvgPicture.asset(assets.delSvg),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: dimen.widthFactor * 4,
                    vertical: dimen.widthFactor),
                child: Text(
                  shortenUrl,
                  style: Get.theme.textTheme.bodyText2!
                      .copyWith(color: colors.lightBlue),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: dimen.heightFactor * 2,
                    horizontal: dimen.widthFactor * 10),
                child: SElevatedButton(
                  primary: primary,
                  padding:
                      EdgeInsets.symmetric(vertical: dimen.heightFactor * 1.2),
                  text: buttonText,
                  onPressed: onPressed,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
