# Flutter Shortly Demo


https://user-images.githubusercontent.com/33119880/142615847-3f1e5d1a-8a89-4c24-8757-05b0fe70185c.mp4


This is a demo project for Grisoft Software Company.

## Summary of the Project

* This is a project that mainly uses GetX State Management and a customized MVC pattern.
* The main focus is to provide good maintainability.
* Supports routing logic.
* This project supports a multi-language system. The whole user interface is interactive.
* The theme system is implemented but not completed because the app's dark design is unknown.
* This project uses a heavily customized strict linter to write better code.
* A custom tool that made by myself use in internal projects to create Flutter-type MVC files easily (mvc_gen.dart).
* Many widgets and views are separated.
* A couple of helper classes were created (Dimen and Shared).

## General Logic of the Project
* When the user opened the app for the first time, the welcome screen is always being showed and after that, a short tutorial view is showed.
* If the user opens the app for the second time, the tutorial view is not being shown.
* To short a link, enter a valid link and press the "Shorten It!" button. After a short time, the shortened link will appear on the screen.
* You can add or delete shortened links easily.

## Used Packages (Flutter & Dart)
- [GetX](https://pub.dev/packages/get)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Flutter Svg](https://pub.dev/packages/flutter_svg)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Clipboard](https://pub.dev/packages/clipboard)
- [Dio](https://pub.dev/packages/dio)

## Notes
I would like to write some tests but at this time to write better and clean code as long as possible, I couldn't find enough time to write a test.
