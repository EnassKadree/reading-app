import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class BookDetailsWhiteContainer extends StatelessWidget {
  const BookDetailsWhiteContainer({ this.maxHeight=0,required this.child, super.key});

  final Widget child;
final  double maxHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxHeight:maxHeight),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: context.colorScheme.outline.withOpacity(0.12),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.shadow.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: child);
  }
}
