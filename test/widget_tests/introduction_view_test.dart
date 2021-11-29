import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shortly_demo/models/history_model.dart';
import 'package:flutter_shortly_demo/routes/app_routes.dart';
import 'package:flutter_shortly_demo/services/pref_service.dart';
import 'package:flutter_shortly_demo/utils/helpers/shared.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/wrapper_named.dart';

void main() {
  group('Initial View Widget Tests', () {
    late final List<HistoryModel> historyList;

    setUpAll(() async {
      historyList = [
        HistoryModel(
          lastUrl: 'https://flutter.dev/',
          shortenUrl: 'https://shrtco.de/dhChiv',
        )
      ];
      final Map<String, Object> setMockInitialValues = {
        sharedKeys.firstLogin: false,
        sharedKeys.linkHistory: HistoryModel.encode(historyList)
      };
      SharedPreferences.setMockInitialValues(setMockInitialValues);

      await Get.putAsync(() => SharedPrefService().init());
    });
    testWidgets('Widget Tests', (tester) async {
      await tester.pumpWidget(
          const WrapperNamed(initialRoute: AppRoutes.introductionView));

      await tester.pumpAndSettle();

      expect(find.byType(PageView), findsOneWidget);

      expect(find.text(localization.skip.tr), findsOneWidget);
      await tester.drag(find.byType(PageView), const Offset(0, 300));
      expect(find.text(localization.brandRecognitionDescription.tr),
          findsOneWidget);

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();
    });
  });
}
