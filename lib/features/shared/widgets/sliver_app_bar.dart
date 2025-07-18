import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class SliverBar extends StatelessWidget {
  const SliverBar({
    this.title,
    this.backButtonVisibility = false,
    this.searchVisibility = true,
    this.menuVisibility = true,
    super.key,
  });

  final String? title;
  final bool? backButtonVisibility;
  final bool? searchVisibility;
  final bool? menuVisibility;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 110.h,
        decoration: BoxDecoration(
          color: ColorsConsts.purple,
          // borderRadius: BorderRadius.only(
          //   bottomRight: Radius.circular(20.r),
          //   ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.08),
          //     blurRadius: 6,
          //     offset: Offset(0, 10),
          //   ),
          // ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (backButtonVisibility ?? false)
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              if (backButtonVisibility ?? false) 12.spaceW,
              Expanded(
                child: Text(
                  title ?? "",
                  style: StylesConsts.f30W500White.copyWith(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (searchVisibility ?? true)
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
              if (menuVisibility ?? true)
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
