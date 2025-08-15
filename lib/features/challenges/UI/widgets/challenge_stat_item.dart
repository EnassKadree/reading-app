import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class ChallengeStatItem extends StatelessWidget {
  const ChallengeStatItem({super.key, required this.icon, required this.color, required this.text});
  final IconData icon;
  final Color color;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        6.spaceW,
        Text(
          text,
          style: StylesConsts.f15W400Grey.copyWith(
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
