import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/introduction_view_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/helpers/shared.dart';
import 'widgets/introduction_card_widget.dart';
import 'widgets/page_step_pointer_widget.dart';

class IntroductionView extends GetView<IntroductionViewController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.cyanBlue,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: dimen.heightFactor * 2),
          child: Column(
            children: [
              SvgPicture.asset(assets.logoSvg),
              Expanded(
                flex: 8,
                child: PageView.builder(
                  itemCount: controller.introductionList.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (BuildContext context, int index) => Center(
                    child: IntroductionCardWidget(
                      svgUrl: controller.introductionList[index].svgUrl,
                      title: controller.introductionList[index].title,
                      description:
                          controller.introductionList[index].description,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.introductionList.length,
                  itemBuilder: (BuildContext context, int index) => Obx(
                    () => PageStepPointerWidget(
                      contentColor:
                          controller.activeIntroductionCardIndex.isEqual(index)
                              ? Colors.grey
                              : Colors.transparent,
                      borderColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.offNamed(AppRoutes.shortenView),
                child: Text(
                  localization.skip.tr,
                  style: Get.theme.textTheme.bodyText2!.copyWith(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
