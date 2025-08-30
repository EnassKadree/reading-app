import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class AuthorInfoContainer extends StatelessWidget {
  const AuthorInfoContainer({required this.iconData,required this.text,super.key});
final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.7),
          width: 1.3,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: context.colorScheme.primary,
            size: 18,
          ),
          8.spaceW,
          Text(
           text,
            style: TextStyle(
              color: context.colorScheme.primary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
