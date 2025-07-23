import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

class SliverBar extends StatelessWidget {
  const SliverBar(
      {this.backButtonVisibility = false,
      this.searchVisibility = true,
      this.title,
      super.key});

  final bool? backButtonVisibility;
  final bool? searchVisibility;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Container(
        color: context.colorScheme.primary,
        height: 120,
        child: Padding(
          padding: EdgeInsets.only(top: 35.h, left: 40.w),
          child: Row(
            children: [
              10.spaceW,
              Text(
                title ?? "",
                style: StylesConsts.f30W500White
                    .copyWith(color: context.colorScheme.surfaceContainer),
              ),
            ],
          ),
        ),
      ),
      elevation: 0,
      floating: true,
      leading: Visibility(
        visible: backButtonVisibility ?? false,
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: context.colorScheme.surfaceContainer,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            color: context.colorScheme.surfaceContainer,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.list,
            color: context.colorScheme.surfaceContainer,
          ),
        ).horizontalPadding,
      ],
    );
  }
}
