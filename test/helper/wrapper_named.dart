import 'package:flutter/material.dart';
import 'package:flutter_shortly_demo/constants/app_constants.dart';
import 'package:flutter_shortly_demo/locales/locales.dart';

import 'package:flutter_shortly_demo/routes/app_views.dart';
import 'package:flutter_shortly_demo/themes/themes.dart';
import 'package:get/get.dart';

class WrapperNamed extends StatelessWidget {
  final Widget? child;
  final List<GetPage>? namedRoutes;
  final String? initialRoute;
  final Transition? defaultTransition;

  const WrapperNamed({
    Key? key,
    this.child,
    this.namedRoutes,
    this.initialRoute,
    this.defaultTransition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      getPages: AppViews.appViews,
      initialRoute: initialRoute,
      locale: Locales.fallbackLocale,
      translations: Locales(),
      fallbackLocale: Locales.fallbackLocale,
    );
  }
}
