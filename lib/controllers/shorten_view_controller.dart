import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/history_model.dart';
import '../models/shorten_model.dart';
import '../services/api_service.dart';
import '../utils/helpers/shared.dart';

class ShortenViewController extends GetxController {
  late final TextEditingController textFieldController;
  late final RxBool _flag;
  late final RxBool isLoading;
  late final RxString _textFieldInput;
  late final RxList shortenResponse;
  late final RxList<HistoryModel> historyList;

  String get textFieldInput => _textFieldInput.value;
  bool get flag => _flag.value;

  @override
  void onInit() {
    _flag = false.obs;
    isLoading = false.obs;
    _textFieldInput = ''.obs;
    shortenResponse = [].obs;
    historyList = <HistoryModel>[].obs;
    textFieldController = TextEditingController();

    final String sharedModelList = shared.getHistoryList();
    historyList.value = HistoryModel.decode(sharedModelList);

    super.onInit();
  }

  void onChanged(String value) {
    _flag.value = value.isEmpty;
  }

  void validFunction() {
    _textFieldInput.value = textFieldController.text;
    _flag.value = _textFieldInput.isEmpty;

    final isValid = Uri.tryParse(textFieldController.text)!.isAbsolute;

    if (isValid && _textFieldInput.isNotEmpty) {
      getData(textFieldController.text);

      return;
    } else if (!isValid && _textFieldInput.isNotEmpty) {
      Get.showSnackbar(
        GetBar(
          margin: EdgeInsets.symmetric(horizontal: dimen.widthFactor * 20),
          messageText: Text(
            localization.notValidText.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.grey.shade800.withOpacity(.9),
          isDismissible: true,
          duration: const Duration(seconds: 2),
          borderRadius: 50,
        ),
      );
    }
  }

  Future getData(String data) async {
    FocusManager.instance.primaryFocus?.unfocus();
    shortenResponse.clear();
    try {
      isLoading.value = true;
      final jsonData = await ApiService().getData(data);
      shortenResponse.add(ShortenModel.fromJson(jsonData));

      historyList.insert(
        0,
        HistoryModel(
          lastUrl: textFieldController.text,
          shortenUrl: shortenResponse[0].result.fullShortLink,
        ),
      );

      final encodeData = HistoryModel.encode(historyList);
      await shared.setHistoryList(encodeData);

      textFieldController.clear();
    } catch (e) {
      await Get.defaultDialog(title: 'Alert', middleText: e.toString());
    }

    isLoading.value = false;
  }

  Future<void> removeData(int index) async {
    historyList.removeAt(index);
    final encodeData = HistoryModel.encode(historyList);

    await shared.setHistoryList(encodeData);
  }

  Future<void> copyClipboard(int index) async {
    await FlutterClipboard.copy(historyList[index].shortenUrl);
  }
}
