import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shortly_demo/models/history_model.dart';
import 'package:flutter_shortly_demo/routes/app_routes.dart';
import 'package:flutter_shortly_demo/routes/app_views.dart';
import 'package:flutter_shortly_demo/services/pref_service.dart';
import 'package:flutter_shortly_demo/utils/helpers/shared.dart';
import 'package:flutter_shortly_demo/views/shorten_view/shorten_view.dart';
import 'package:flutter_shortly_demo/views/shorten_view/widgets/shorten_empty_history_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shorten_view_contoller_mock.dart';
import '../helper/wrapper_named.dart';

@GenerateMocks([MockShortenViewController])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Initial View Widget Tests', () {
    late final List<HistoryModel> historyList;

    setUpAll(() async {
      historyList = [];
      final Map<String, Object> setMockInitialValues = {
        sharedKeys.firstLogin: false,
        sharedKeys.linkHistory: HistoryModel.encode(historyList)
      };
      SharedPreferences.setMockInitialValues(setMockInitialValues);

      await Get.putAsync(() => SharedPrefService().init());
    });
    testWidgets('Widget Tests', (tester) async {
      await tester.pumpWidget(WrapperNamed(
          initialRoute: AppRoutes.shortenView, namedRoutes: AppViews.appViews));

      await tester.pumpAndSettle();

      expect(find.byType(ShortenView), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(ShortenEmptyHistoryWidget), findsOneWidget);
      expect(find.byType(SvgPicture), findsNWidgets(3));
    });
  });
}
