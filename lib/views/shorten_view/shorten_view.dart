import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/shorten_view_controller.dart';
import '../../utils/helpers/shared.dart';
import '../../widgets/s_elevated_button.dart';
import 'widgets/history_widget.dart';
import 'widgets/shorten_empty_history_widget.dart';

class ShortenView extends GetView<ShortenViewController> {
  const ShortenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputDecorationTheme inputDecorationTheme =
        Get.theme.inputDecorationTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colors.lightGray,
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          height: dimen.height,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: dimen.heightFactor * 10),
                  Obx(() => controller.historyList.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(bottom: dimen.heightFactor),
                          child: Text(
                            localization.yourLinkHistory.tr,
                            style: Get.theme.textTheme.headline6,
                          ),
                        )
                      : const SizedBox.shrink()),
                  Obx(
                    () => controller.historyList.isEmpty
                        ? ShortenEmptyHistoryWidget(
                            title: localization.letsGetStartedTitle.tr,
                            description:
                                localization.letsGetStartedDescription.tr,
                            logoSvgUrl: assets.logoSvg,
                            illustrationSvgUrl: assets.illustrationSvg,
                          )
                        : Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.historyList.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (BuildContext context, int index) {
                                final RxBool copied = false.obs;

                                return Obx(
                                  () => HistoryWidget(
                                    text: copied.value
                                        ? localization.copied.tr
                                        : localization.copy.tr,
                                    primary: copied.value
                                        ? colors.blueMagenta
                                        : colors.lightBlue,
                                    lastUrl:
                                        controller.historyList[index].lastUrl,
                                    shortenUrl: controller
                                        .historyList[index].shortenUrl,
                                    onDeleted: () =>
                                        controller.removeData(index),
                                    onPressed: () {
                                      controller.copyClipboard(index);

                                      copied.value = true;
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.historyList.isEmpty
                        ? const Spacer()
                        : const SizedBox.shrink(),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: dimen.widthFactor * 40,
                          bottom: dimen.heightFactor * 10,
                        ),
                        width: double.infinity,
                        height: dimen.heightFactor * 25,
                        color: colors.blueMagenta,
                        child: SvgPicture.asset(assets.shapeSvg),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: dimen.widthFactor * 12),
                        child: Column(
                          children: [
                            Obx(
                              () => TextField(
                                controller: controller.textFieldController,
                                onChanged: controller.onChanged,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  focusedBorder: inputDecorationTheme
                                      .focusedBorder!
                                      .copyWith(
                                    borderSide: BorderSide(
                                        color: controller.flag
                                            ? Colors.red
                                            : Colors.transparent,
                                        width: 2),
                                  ),
                                  enabledBorder: inputDecorationTheme
                                      .enabledBorder!
                                      .copyWith(
                                    borderSide: BorderSide(
                                      color: controller.flag
                                          ? Colors.red
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  hintText: controller.flag
                                      ? localization.textFieldErrorHint.tr
                                      : localization.textFieldHint.tr,
                                  hintStyle:
                                      inputDecorationTheme.hintStyle!.copyWith(
                                    color: controller.flag
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: dimen.heightFactor),
                            SElevatedButton(
                              text: localization.shortenIt.tr,
                              style: Get.theme.textTheme.headline6!
                                  .copyWith(color: Colors.white),
                              padding: EdgeInsets.symmetric(
                                vertical: dimen.heightFactor,
                              ),
                              onPressed: controller.validFunction,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Obx(
                () => controller.isLoading.value
                    ? Align(
                        child: CircularProgressIndicator(
                          color: colors.lightBlue,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
