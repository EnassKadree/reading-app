import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class SliverBar extends StatelessWidget {
  const SliverBar({
    this.title,
    this.backButtonVisibility = false,
    this.searchVisibility = true,
    this.menuVisibility = true,
    this.whiteColor = true,
    this.actionWidget,
    super.key,
  });

  final String? title;
  final bool? backButtonVisibility;
  final bool? searchVisibility;
  final bool? menuVisibility;
  final bool? whiteColor;
  final Widget? actionWidget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 10,
      actionsPadding: const EdgeInsetsGeometry.directional(end: 16),
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        color: (whiteColor == true)
            ? context.colorScheme.surfaceContainer
            : context.colorScheme.primary,
        height: 120,
        child: Padding(
          padding: EdgeInsets.only(top: 35.h, left: 40.w),
          child: Row(
            children: [
              20.spaceW,
              Text(
                title ?? "",
                style: StylesConsts.f30W500White.copyWith(
                  color: (whiteColor != true)
                      ? context.colorScheme.surfaceContainer
                      : context.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),

      floating: true,
      leading: Visibility(
        visible: backButtonVisibility ?? false,
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: (whiteColor != true)
                ? context.colorScheme.surfaceContainer
                : context.colorScheme.primary,
          ),
        ),
      ),
      actions: [
        if (searchVisibility ?? true)
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            color: (whiteColor != true)
                ? context.colorScheme.surfaceContainer
                : context.colorScheme.primary,
          ),
        ),
        10.spaceW,
        if (menuVisibility ?? true)
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.list,
              color: (whiteColor != true)
                  ? context.colorScheme.surfaceContainer
                  : context.colorScheme.primary,
            ),
          ),
        10.spaceW,
         actionWidget??const SizedBox()
      ],
    );
  }
}
