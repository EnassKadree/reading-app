import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
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
          return GestureDetector(
            onTap: (){
              context.read<JoinBookChallengeCubit>().joinBookChallenge(bookId);},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              height: 30.h,
              width: 90.w,
              decoration: BoxDecoration(
                boxShadow:[
                  BoxShadow(
                  color: context.colorScheme.tertiary.withAlpha(150),
                  spreadRadius: 1,
                  blurRadius: 1,
                )],
                border: Border.all(color: context.colorScheme.tertiary, width: 1.7),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(child: Text('Join',style: StylesConsts.f18W600White)),
            ),
          );
        }
        else if (state is JoinBookChallengeLoading) {
          return Lottie.asset(AssetsConsts.loadingAsset,
              height: 40, width: 40);
        }
        else
        {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: 30.h,
            width: 90.w,
            decoration: BoxDecoration(
              boxShadow:[ BoxShadow(
                color: context.colorScheme.secondary,
                spreadRadius: 1,
                blurRadius: 1,
              )],
              color: context.colorScheme.secondary.withAlpha(150),
              border: Border.all(color: context.colorScheme.secondary, width: 1.7),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(child: Text('Joined',style: StylesConsts.f18W600White)),
          );
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
