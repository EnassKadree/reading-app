
import 'package:flutter/material.dart';

class SlideRight<T> extends PageRouteBuilder<T> {
  final Widget page;

  SlideRight({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(-1, 0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
}
