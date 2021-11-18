import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helpers/shared.dart';

class SharedPrefService extends GetxService {
  late final SharedPreferences prefs;

  Future<SharedPrefService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool getFirstLogin() {
    return prefs.getBool(sharedKeys.firstLogin) ?? true;
  }

  Future<void> setFirstLogin(bool newValue) async {
    await prefs.setBool(sharedKeys.firstLogin, newValue);
  }

  String getHistoryList() {
    return prefs.getString(sharedKeys.linkHistory) ?? '[]';
  }

  Future<void> setHistoryList(String newValue) async {
    await prefs.setString(sharedKeys.linkHistory, newValue);
  }
}
