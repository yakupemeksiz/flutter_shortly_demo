import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/history_model.dart';
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

  List<HistoryModel> getHistoryList() {
    return HistoryModel.decode(prefs.getString(sharedKeys.linkHistory) ?? '[]');
  }

  Future<void> setHistoryList(List<HistoryModel> newValue) async {
    await prefs.setString(
        sharedKeys.linkHistory, HistoryModel.encode(newValue));
  }
}
