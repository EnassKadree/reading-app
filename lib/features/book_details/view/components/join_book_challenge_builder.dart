import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_details_button.dart';

import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../service/join_book_challenge/join_book_challenge_cubit.dart';
import '../../service/join_book_challenge/join_book_challenge_states.dart';

class JoinBookChallengeBuilder extends StatelessWidget {
  const JoinBookChallengeBuilder({ required this.bookId,super.key});
  final int bookId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinBookChallengeCubit,JoinBookChallengeStates>(
      builder: (BuildContext context,JoinBookChallengeStates state ) {
        if(state is JoinBookChallengeInitial || state is JoinBookChallengeError ) {
          return  BookDetailsButton(
              color: context.colorScheme.tertiary.withAlpha(120),
              function: (){
                context.read<JoinBookChallengeCubit>().joinBookChallenge(bookId);},
              buttonText: 'join');
        }
        else if (state is JoinBookChallengeLoading) {
          return  BookDetailsButton(
            color: context.colorScheme.tertiary.withAlpha(120),
              function: (){},
              buttonText: '',
              child: Lottie.asset(AssetsConsts.loadingAsset,
                  height: 40, width: 40)
              ).horizontalPadding;
        }
        else
        {
          return  BookDetailsButton(
              color: context.colorScheme.tertiary.withAlpha(120),
            function: (){},
              buttonText: 'joined');
        }

      }
      ,
      listener:(BuildContext context,JoinBookChallengeStates state ){
        if(state is JoinBookChallengeError) {
          Functions().showSnackBar(context, state.errorMessage);
        }
      } ,
    );
  }
}
