import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/helpers/shared.dart';

class WelcomeViewController extends GetxController {
  void onPressed() {
    if (shared.getFirstLogin()) {
      Get.offAndToNamed(AppRoutes.introductionView);
      return;
    }

    Get.offAndToNamed(AppRoutes.shortenView);
  }
}
