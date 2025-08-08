import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class ProfileSurfaceContainer extends StatelessWidget {
  const ProfileSurfaceContainer({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    this.isItalic = false,
  });
  final Icon icon;
  final String title;
  final String desc;
  final bool isItalic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              12.spaceW,
              Text(
                title,
                style: StylesConsts.f18W600Black.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          16.spaceH,
          Text(
            desc,
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 16,
              height: 1.5,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
