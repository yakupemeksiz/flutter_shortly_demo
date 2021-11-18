import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimen {
  final Size _screenSize = Get.size;

  double get width => _screenSize.width;
  double get height => _screenSize.height;

  double get widthFactor => width / 100;
  double get heightFactor => height / 100;
}
