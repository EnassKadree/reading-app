import 'package:flutter/material.dart';
import 'animated_route.dart';

extension Context on BuildContext
{

  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(SlideRight(page: page));
  }

  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil<T>(
      SlideRight(page: page),
          (route) => false,
    );
  }

  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.of(this).pushReplacement<T, TO>(SlideRight(page: page));
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
  /// is dark mode currently enabled?
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // colors
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);
}
