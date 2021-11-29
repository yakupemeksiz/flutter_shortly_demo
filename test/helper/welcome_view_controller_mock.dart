import 'package:flutter_shortly_demo/controllers/welcome_view_controller.dart';
import 'package:flutter_shortly_demo/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockWelcomeViewController extends GetxController
    with Fake
    implements WelcomeViewController {
  @override
  void onPressed() {
    Get.offNamed(AppRoutes.introductionView);
  }
}
