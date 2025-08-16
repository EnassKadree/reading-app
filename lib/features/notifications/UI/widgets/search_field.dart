import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/notifications_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          return TextField(
            onChanged: (query) {
              context.read<NotificationsCubit>().searchNotifications(query);
            },
            decoration: InputDecoration(
              hintText: JsonConsts.searchNotifications.t(context),
              hintStyle: StylesConsts.f15W400Grey.copyWith(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              prefixIcon: Icon(
                Iconsax.search_normal,
                color: Colors.grey[500],
                size: 20,
              ),
              suffixIcon: state.isSearching
                  ? IconButton(
                      onPressed: () {
                        context.read<NotificationsCubit>().clearSearch();
                      },
                      icon: Icon(
                        Iconsax.close_circle,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                    )
                  : null,
              filled: true,
              fillColor: context.colorScheme.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                  width: 1,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
