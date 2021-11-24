part of 'shared.dart';

Future<void> showSnackbar(String messageText) async {
  await Get.showSnackbar(
    GetBar(
      margin: EdgeInsets.symmetric(horizontal: dimen.widthFactor * 20),
      messageText: Text(
        messageText,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
      backgroundColor: Colors.grey.shade800.withOpacity(.9),
      isDismissible: true,
      duration: const Duration(seconds: 2),
      borderRadius: 50,
    ),
  );
}
