import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/profile_model.dart';
import '../screens/setup_profile_screen.dart';
import 'profile_circle_avatar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader(
      {super.key, this.editable = false, required this.profile});
  final bool editable;
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: Functions().staggeredList([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(JsonConsts.profile.t(context),
                    style: StylesConsts.f20BoldWhite
                        .copyWith(color: context.colorScheme.onSurface)),
                editable
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[800]!.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () =>
                              context.push(SetupProfileScreenWrapper(
                            isSetup: false,
                            profile: profile,
                          )),
                          icon: Icon(
                            Iconsax.edit,
                            color: context.colorScheme.primary,
                            size: 18,
                          ),
                        ),
                      )
                    : 0.spaceH,
              ],
            ),
            16.spaceH,
            Row(
              children: [
                ProfileCircleAvatar(
                  picture: profile.picture,
                  borderColor: context.colorScheme.primary,
                ),
                12.spaceW,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: AutoSizeText(
                          '${profile.firstName} ${profile.lastName}',
                          style: StylesConsts.f20BoldWhite
                              .copyWith(color: context.colorScheme.primary)),
                    ),
                    4.spaceH,
                    Text(
                      '@${profile.nickname}',
                      style: StylesConsts.f15W400Grey.copyWith(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
