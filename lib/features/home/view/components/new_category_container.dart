

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/category.dart';

import '../../../shared/widgets/custom_network_image.dart';

class NewCategoryCard extends StatelessWidget {
  const NewCategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1,
            color: context.colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            category.icon == null
                ? Icon(
             Icons. sports_basketball,
              color: Colors.grey.shade700,
            )
                : ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4),
              child: CustomNetworkImage(
                width: 24.w,
              imageUrl:  category.icon,
                fit: BoxFit.cover,

              ),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                category.name,
                style: StylesConsts.f16W600Black,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ).horizontalPadding;
  }
}