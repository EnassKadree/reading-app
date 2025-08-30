import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/category.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../category_details/view/category_book_screen_wrapper.dart';
import '../../../shared/widgets/custom_network_image.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.secondary, width: 1.7),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //  spacing: 5,
          children: [
            Icon(
              Icons.sports_basketball,
              size: 15,
              color: context.colorScheme.secondary,
            ),
            // CustomNetworkImage(
            //   height: 21.h,width: 21.h,
            //   imageUrl: category.icon,
            // ),
            2.spaceW,
            Text(
              category.name,
              style: StylesConsts.f16W600Black,
            ),
          ],
        ),
      ),
    );
  }
}
