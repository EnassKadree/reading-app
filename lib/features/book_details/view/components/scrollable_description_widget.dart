import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_details_white_container.dart';
import '../../../../core/utils/constants/styles_consts.dart' show StylesConsts;

class ScrollableDescriptionWidget extends StatefulWidget {
  const ScrollableDescriptionWidget({required this.description, super.key});

  final String description;

  @override
  State<ScrollableDescriptionWidget> createState() =>
      _ScrollableDescriptionWidgetState();
}

class _ScrollableDescriptionWidgetState
    extends State<ScrollableDescriptionWidget> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: StylesConsts.f24BoldBlack.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: context.colorScheme.onSurface,
            ),
          ),
          20.spaceH,
         BookDetailsWhiteContainer(
           maxHeight: 140.h,
           child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: ScrollbarTheme(
                data: ScrollbarThemeData(

                  thumbColor: MaterialStateProperty.all(
                    context.colorScheme.primary.withOpacity(0.6)
                  ),
                  trackColor: MaterialStateProperty.all(
                    context.colorScheme.outline.withOpacity(0.1)
                  ),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  interactive: true,
                  trackVisibility: true,
                  radius: Radius.circular(8.r),
                  thickness: 4.w,
                  controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(20.w),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: context.colorScheme.onSurface.withOpacity(0.8),
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
