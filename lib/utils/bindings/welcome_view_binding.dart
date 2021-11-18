import 'package:get/get.dart';

import '../../controllers/welcome_view_controller.dart';

class WelcomeViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WelcomeViewController());
  }
}
