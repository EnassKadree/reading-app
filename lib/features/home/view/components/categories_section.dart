import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/view/components/category_card.dart';
import '../../../shared/models/category.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({required this.categories, super.key});

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: AnimationLimiter(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return CategoryCard(
                category: categories[index],
              ).staggerListVertical(index);
            },
            itemCount: categories.length),
      ),
    );
  }
}
