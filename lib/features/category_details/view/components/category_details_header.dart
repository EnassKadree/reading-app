import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/data/data_source.dart';

class CategoryDetailsHeader extends StatelessWidget {
  const CategoryDetailsHeader({ required this.categoryName,super.key});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 12.w, top: 30.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: DataSource().getLocale()=='ar'? const Icon(Iconsax.arrow_right):Icon(Iconsax.arrow_square_left4),
          ),
          Expanded(
            child: Text(
              categoryName,
              style: StylesConsts.f20W600Yellow.copyWith(
                color: context.colorScheme.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
