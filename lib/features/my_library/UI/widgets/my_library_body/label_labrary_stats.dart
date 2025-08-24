import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';



class LibrarySectionLabel extends StatelessWidget {
  final String title;
  final IconData icon;

  const LibrarySectionLabel({
    super.key,
    required this.title,
    required this.icon ,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorsConsts.purple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: ColorsConsts.purple,
            size: 20,
          ),
        ),
        12.spaceW,
        Text(
          title,
          style: StylesConsts.f16W600Black.copyWith(
            color: ColorsConsts.purple,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
