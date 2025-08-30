import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/category.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/constants/colors_consts.dart';
import '../../../category_details/view/category_book_screen_wrapper.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(CategoryBooksScreenWrapper(
          category: category,
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: ColorsConsts.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  Iconsax.book_1,
                  size: 18.sp,
                  color: ColorsConsts.purple,
                ),
              ),
            ),
            12.spaceW,
            Text(
              category.name,
              style: StylesConsts.f16W600Black.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorsConsts.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
