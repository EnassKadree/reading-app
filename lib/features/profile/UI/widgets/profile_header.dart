import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/colors_consts.dart';
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ColorsConsts.gradientColors),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    JsonConsts.profile.t(context),
                    style: StylesConsts.f18W600Black.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => context.push(SetupProfileScreenWrapper(
                        isSetup: false,
                        profile: profile,
                      )),
                      icon: const Icon(
                        Iconsax.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              16.spaceH,
              Row(
                children: [
                  ProfileCircleAvatar(picture: profile.picture),
                  12.spaceW,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${profile.firstName} ${profile.lastName}',
                        style: StylesConsts.f18W600Black.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      4.spaceH,
                      Text(
                        '@${profile.nickname}',
                        style: StylesConsts.f15W400Grey.copyWith(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
