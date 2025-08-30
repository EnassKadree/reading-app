import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class BuildMyLibrary extends StatelessWidget {
  const BuildMyLibrary({
    super.key,
    this.opacity=1,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.padding=0
  });
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final double opacity;
  final int padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color.withOpacity(opacity),
                size: 24,
              ),
            ),
            8.spaceH,
            AutoSizeText(
              label,
              style: StylesConsts.f15W400Grey.copyWith(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            padding.spaceH
          ],
        ),
      ),
    );
  }
}
