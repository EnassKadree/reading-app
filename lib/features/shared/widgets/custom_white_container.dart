import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class CustomWhiteContainer extends StatelessWidget {
  const CustomWhiteContainer({super.key, required this.child, this.margin, this.padding});
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: margin,
        padding: padding ?? const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child);
  }
}
