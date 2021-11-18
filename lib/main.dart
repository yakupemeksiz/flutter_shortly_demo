import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/app_constants.dart';
import 'locales/locales.dart';
import 'routes/app_routes.dart';
import 'routes/app_views.dart';
import 'services/pref_service.dart';
import 'themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => SharedPrefService().init());
  runApp(const ShortlyDemoApp());
}

class ShortlyDemoApp extends StatelessWidget {
  const ShortlyDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppViews.appViews,
      initialRoute: AppRoutes.initialView,
      locale: Locales.fallbackLocale,
      translations: Locales(),
      fallbackLocale: Locales.fallbackLocale,
    );
  }
}
