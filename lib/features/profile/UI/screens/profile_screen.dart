import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/lists/dummy_profile.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/profile/UI/widgets/stats_section.dart';
import 'package:reading_app/features/profile/UI/widgets/badges_container.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../logic/profile/profile_cubit.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.userId});
  final int? userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFailure) {
            return Center(
              child: SomeThingWentWrongWidget(onPressed: () {
                context.read<ProfileCubit>().getProfile(userId: userId);
              }),
            );
          }
          ProfileModel data =
              state is ProfileSuccess ? state.profile : dummyProfile;
          return Skeletonizer(
              enabled: state is ProfileLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeader(
                      editable: userId == null,
                      profile: data,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: Functions().staggeredList([
                          ProfileSurfaceContainer(
                            icon: Icon(
                              Iconsax.quote_down,
                              color: Colors.blue[400],
                              size: 18,
                            ),
                            title: JsonConsts.favoriteQuote.t(context),
                            desc: data.quote,
                            isItalic: true,
                          ),
                          24.spaceH,
                          ProfileSurfaceContainer(
                              icon: Icon(
                                Iconsax.user,
                                color: Colors.purple[400],
                                size: 18,
                              ),
                              title: JsonConsts.bio.t(context),
                              desc: data.bio),
                          28.spaceH,
                          StatsSection(
                            profile: data,
                          ),
                          28.spaceH,
                          BadgesContainer(
                            badges: data.badges,
                          ),
                          32.spaceH,
                        ]),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

class ProfileScreenWrapper extends StatelessWidget {
  const ProfileScreenWrapper({super.key, this.userId});
  final int? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfile(userId: userId),
      child: ProfileScreen(userId: userId),
    );
  }
}
