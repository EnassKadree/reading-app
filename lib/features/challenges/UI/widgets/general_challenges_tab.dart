import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/challenges/logic/challenge/challenge_cubit.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/lists/dummy_challenges.dart';
import '../../logic/general_challenges/general_challenges_cubit.dart';
import 'expandable_challenge_card.dart';
import 'challenges_empty_state.dart';

class GeneralChallengesTab extends StatelessWidget {
  const GeneralChallengesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralChallengesCubit, GeneralChallengesState>(
      listener: (context, state) {
        if (state is GeneralChallengesSuccess) {
          context.read<ChallengeCubit>().loadJoinedChallenges(state.challenges);
        }
      },
      builder: (context, state) {
        if (state is GeneralChallengesFailure) {
          return Center(
            child: SomeThingWentWrongWidget(onPressed: () {
              context.read<GeneralChallengesCubit>().get();
            }),
          );
        }

        final List<ChallengeModel> data = state is GeneralChallengesSuccess
            ? state.challenges
            : dummyChallenges;

        // Show empty state if no challenges available
        if (data.isEmpty) {
          return ChallengesEmptyState(
            isCompletedChallenges: false,
            onRefresh: () {
              context.read<GeneralChallengesCubit>().get();
            },
          );
        }

        return Skeletonizer(
          enabled: state is GeneralChallengesLoading,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16.h),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final challenge = data[index];
              return ExpandableChallengeCard(challenge: challenge)
                  .staggerListVertical(index);
            },
          ),
        );
      },
    );
  }
}
