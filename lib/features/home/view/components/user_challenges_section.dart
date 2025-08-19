import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/view/components/no_challenges_container.dart';
import 'package:reading_app/features/home/view/components/user_challenge_card.dart';
import 'package:reading_app/features/shared/models/user_challenge.dart';

class UserChallengesSection extends StatelessWidget {
  const UserChallengesSection({ required this.userChallenges,super.key});
 final List<UserChallenge>userChallenges;
  @override
  Widget build(BuildContext context) {
        {

          if (userChallenges.isNotEmpty) {
            return SizedBox(
              height: 140.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return ActiveChallengeCard(userChallenge:userChallenges[index]);
                  },
                  itemCount: userChallenges.length),
            );
          }
          else {
            return const NoChallengesContainer();
          }
        }
  }
}
