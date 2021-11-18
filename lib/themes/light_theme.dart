part of 'themes.dart';

final ThemeData _lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: colors.lightBlue,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: dimen.heightFactor),
    filled: true,
    fillColor: colors.lightGray,
    hintStyle: Get.theme.textTheme.bodyText2!.copyWith(
      color: Colors.grey,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      headline4: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    ),
  ),
);
