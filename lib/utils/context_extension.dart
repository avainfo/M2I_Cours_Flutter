import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get screenWidth => size.width;
  double get screenHeight => size.height;
}