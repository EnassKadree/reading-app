import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class StatItem extends StatelessWidget {
  const StatItem({
    super.key,
    this.opacity = 0.2,
    required this.icon,
    required this.label,
    required this.color,
    required this.value,
  });
  final IconData icon;
  final String label;
  final Color color;
  final double opacity;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withOpacity(opacity),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 16,
                    ),
                  ),
                  10.spaceW,
                  Expanded(
                    child: AutoSizeText(
                      label,
                      maxLines: 1,
                      minFontSize: 10,
                      style: StylesConsts.f15W400Grey.copyWith(
                        fontSize: 14,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              10.spaceH,
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: value.toDouble()),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                builder: (context, animatedValue, _) {
                  return Text(
                    animatedValue.toInt().toString(),
                    style: StylesConsts.f23W600Yellow
                        .copyWith(color: color, fontWeight: FontWeight.w700),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
