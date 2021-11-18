import 'package:get/get.dart';

import '../../controllers/shorten_view_controller.dart';

class ShortenViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ShortenViewController());
  }
}