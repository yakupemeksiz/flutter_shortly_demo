import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/api_constants.dart';
import '../../constants/asset_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/locale_key_constants.dart';
import '../../constants/shared_prefs_constants.dart';
import '../../services/pref_service.dart';
import 'dimen.dart';

part 'shared_functions.dart';

final _assets = AssetConstants();
final _localization = LocaleKeyConstants();
final _colors = ColorConstants();
final _dimen = Dimen();
final _shared = Get.find<SharedPrefService>();
final _sharedKeys = SharedPrefsConstants();
final _apiConstants = ApiBaseConstants();

AssetConstants get assets => _assets;
LocaleKeyConstants get localization => _localization;
ColorConstants get colors => _colors;
Dimen get dimen => _dimen;
SharedPrefService get shared => _shared;
SharedPrefsConstants get sharedKeys => _sharedKeys;
ApiBaseConstants get apiConstants => _apiConstants;
