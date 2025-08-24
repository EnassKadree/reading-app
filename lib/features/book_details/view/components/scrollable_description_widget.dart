import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "description".t(context),
          style: StylesConsts.f24BoldBlack,
        ),
        10.spaceH,
        Container(
          constraints: BoxConstraints(maxHeight: 120.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
                minThumbLength: 12,
                thumbColor:
                    MaterialStateProperty.all(context.colorScheme.secondary)),
            child: Scrollbar(
              thumbVisibility: true,
              interactive: true,
              trackVisibility: true,
              radius: Radius.circular(5.r),
              thickness: 4.w,
              controller: scrollController,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0.w),
                  child: Text(
                    '''${widget.description} ${widget.description} ${widget.description} ${widget.description}  ''',
                    style: TextStyle(
                        fontSize: 16.sp, color: Colors.grey, height: 1.6.h),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ).horizontalPadding;
  }
}
