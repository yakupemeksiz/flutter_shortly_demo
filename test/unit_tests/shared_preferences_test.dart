import 'package:flutter_shortly_demo/models/history_model.dart';
import 'package:flutter_shortly_demo/services/pref_service.dart';
import 'package:flutter_shortly_demo/utils/helpers/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  group('SharedPreferences tests', () {
    late final List<HistoryModel> historyList;
    late final Map<String, Object> setMockInitialValues;

    setUpAll(() async {
      setMockInitialValues = {
        sharedKeys.firstLogin: bool,
        sharedKeys.linkHistory: HistoryModel
      };
      historyList = [
        HistoryModel(
          lastUrl: 'https://flutter.dev/',
          shortenUrl: 'https://shrtco.de/dhChiv',
        ),
      ];
      SharedPreferences.setMockInitialValues(setMockInitialValues);
      await Get.putAsync(() => SharedPrefService().init());
    });

    test(
        'return data from .getHistoryList() should be type of List<HistoryModel>',
        () async {
      await shared.setHistoryList(historyList);

      expect(shared.getHistoryList() is List<HistoryModel>, true);
    });

    test('.getData() should be true and should be false', () async {
      await shared.setFirstLogin(true);
      expect(shared.getFirstLogin(), true);

      await shared.setFirstLogin(false);
      expect(shared.getFirstLogin(), false);
    });
  });
}
