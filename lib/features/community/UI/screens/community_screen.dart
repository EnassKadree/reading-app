import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/lists/dummy_profile.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/community/UI/widgets/leaderboard_widget.dart';
import 'package:reading_app/features/community/UI/widgets/list_tile_card.dart';
import 'package:reading_app/features/community/logic/community/community_cubit.dart';
import 'package:reading_app/features/profile/UI/widgets/setup_profile_form_field.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../shared/widgets/something_went_wrong.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CommunityCubit>();
    return Scaffold(
      body: BlocBuilder<CommunityCubit, CommunityState>(
        builder: (context, state) {
          if (state is CommunityFailure) {
            return Center(
              child: SomeThingWentWrongWidget(onPressed: () {
                context.read<CommunityCubit>().getCommunity();
              }),
            );
          }
          List<ProfileModel> data =
              state is CommunitySuccess ? state.profiles : dummyProfileList;
          if (data.isEmpty) {
            return Center(
              child: Text(
                JsonConsts.noData.t(context),
                style: StylesConsts.f23W600Yellow,
              ),
            );
          }
          return SingleChildScrollView(
            child: Skeletonizer(
              enabled: state is CommunityLoading,
              child: Column(
                children: [
                  16.spaceH,
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: LeaderboardWidget(
                      profiles: data,
                    ),
                  ),
                  SetupProfileFormField(
                    hint: JsonConsts.search.t(context),
                    controller: TextEditingController(),
                    type: TextInputType.text,
                    icon: Iconsax.search_normal,
                    onFieldSubmitted: (value) {
                      cubit.isArranged = false;
                      cubit.getCommunity(value);
                    },
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTileCard(
                          index: index + 1,
                          profile: data[index],
                          isArranged: cubit.isArranged,
                        );
                      }),
                  32.spaceH
                ],
              ),
            ),
          );
        },
      ).horizontalPadding,
    );
  }
}

class CommunityScreenWrapper extends StatelessWidget {
  const CommunityScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityCubit()..getCommunity(),
      child: const CommunityScreen(),
    );
  }
}
