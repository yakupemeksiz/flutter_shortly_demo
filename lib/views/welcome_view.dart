import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/welcome_view_controller.dart';
import '../utils/helpers/shared.dart';
import '../widgets/s_elevated_button.dart';

class WelcomeView extends GetView<WelcomeViewController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: dimen.heightFactor,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: dimen.heightFactor),
                child: SvgPicture.asset(assets.logoSvg),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: dimen.heightFactor * 2,
                    left: dimen.widthFactor * 10,
                  ),
                  child: SvgPicture.asset(
                    assets.illustrationSvg,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: dimen.widthFactor * 8),
                  child: Column(
                    children: [
                      Text(
                        localization.welcomeViewTitle.tr,
                        style: Get.theme.textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: dimen.heightFactor * 5,
                      ),
                      Text(
                        localization.welcomeViewDescription.tr,
                        style: Get.theme.textTheme.bodyText2!
                            .copyWith(fontSize: 16, letterSpacing: -0.5),
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      SElevatedButton(
                        text: localization.start.tr.toUpperCase(),
                        onPressed: controller.onPressed,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
