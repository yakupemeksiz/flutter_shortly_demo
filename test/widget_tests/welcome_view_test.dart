import 'package:flutter_shortly_demo/models/history_model.dart';
import 'package:flutter_shortly_demo/routes/app_routes.dart';
import 'package:flutter_shortly_demo/routes/app_views.dart';
import 'package:flutter_shortly_demo/services/pref_service.dart';
import 'package:flutter_shortly_demo/utils/helpers/shared.dart';
import 'package:flutter_shortly_demo/views/introduction_view/introduction_view.dart';
import 'package:flutter_shortly_demo/views/welcome_view.dart';
import 'package:flutter_shortly_demo/widgets/s_elevated_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/welcome_view_controller_mock.dart';
import '../helper/wrapper_named.dart';

@GenerateMocks([MockWelcomeViewController])
void main() {
  group('Welcome View Widget Tests', () {
    late final List<HistoryModel> historyList;
    late MockWelcomeViewController welcomeViewController;

    setUpAll(() async {
      welcomeViewController = MockWelcomeViewController();

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
      await tester.pumpWidget(WrapperNamed(
          initialRoute: AppRoutes.initialView, namedRoutes: AppViews.appViews));

      await tester.pumpAndSettle();

      expect(find.byType(WelcomeView), findsOneWidget);
      expect(find.byType(SElevatedButton), findsOneWidget);

      expect(find.text(localization.welcomeViewTitle.tr), findsOneWidget);
      expect(find.text(localization.welcomeViewDescription.tr), findsOneWidget);
      expect(find.text(localization.start.tr.toUpperCase()), findsOneWidget);

      welcomeViewController.onPressed();

      await tester.pumpAndSettle();
      expect(find.byType(IntroductionView), findsOneWidget);
    });
  });
}
