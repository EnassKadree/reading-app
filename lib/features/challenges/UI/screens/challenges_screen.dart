import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_challenges.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import '../widgets/expandable_challenge_card.dart';
import '../../logic/challenge/challenge_cubit.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChallengeCubit(),
      child: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.only(top: 64.h),
          itemCount: dummyChallenges.length,
          itemBuilder: (context, index) {
            final challenge = dummyChallenges[index];
            return ExpandableChallengeCard(challenge: challenge)
                .staggerListVertical(index);
          },
        ),
      ),
    );
  }
}

class ChallengesScreenWrapper extends StatelessWidget {
  const ChallengesScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChallengesScreen();
  }
}
