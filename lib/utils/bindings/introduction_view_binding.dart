import 'package:get/get.dart';

import '../../controllers/introduction_view_controller.dart';

class IntroductionViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(IntroductionViewController());
  }
}