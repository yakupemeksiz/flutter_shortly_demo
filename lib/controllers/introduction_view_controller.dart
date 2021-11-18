import 'package:get/get.dart';

import '../models/introduction_content_model.dart';
import '../utils/helpers/shared.dart';

class IntroductionViewController extends GetxController {
  final RxInt _activeIntroductionCardIndex = 0.obs;

  int get activeIntroductionCardIndex => _activeIntroductionCardIndex.value;

  void onPageChanged(int value) {
    _activeIntroductionCardIndex.value = value;
  }

  @override
  void onInit() {
    shared.setFirstLogin(false);

    super.onInit();
  }

  final List<IntroductionContentModel> introductionList = [
    IntroductionContentModel(
      title: localization.brandRecognitionTitle.tr,
      description: localization.brandRecognitionDescription.tr,
      svgUrl: assets.brushesSvg,
    ),
    IntroductionContentModel(
      title: localization.detailedRecortTitle.tr,
      description: localization.detailedRecortDescription.tr,
      svgUrl: assets.brushesSvg,
    ),
    IntroductionContentModel(
      title: localization.fullyCustomizableTitle.tr,
      description: localization.fullyCustomizableDescription.tr,
      svgUrl: assets.brushesSvg,
    )
  ];
}
