import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/widgets/custom_white_container.dart';

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
    return CustomWhiteContainer(
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
