import 'package:flutter/material.dart';

class UiConstants {
  BuildContext context;
  UiConstants(this.context);
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
}
