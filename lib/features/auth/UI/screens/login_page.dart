import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

import 'package:reading_app/features/auth/UI/widgets/auth_screen_body.dart';
import 'package:reading_app/features/auth/logic/password/password_visibility_cubit.dart';
import 'package:reading_app/features/auth/logic/register/register_cubit.dart';
import 'package:reading_app/features/shared/widgets/custom_button.dart';

import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/functions/functions.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MultiBlocProvider
    (
      providers: 
      [
        BlocProvider(create: (context) => RegisterCubit(),),
        BlocProvider(create: (context) => PasswordVisibilityCubit(),),
      ],
      child: Scaffold
      (
        bottomNavigationBar: Builder(
          builder: (context) 
          {
            return CustomOutlinedButton
            (
              title: JsonConsts.login,
              onPressed: ()
              {context.read<RegisterCubit>().submit(isRegister: false);},
            ).mainPadding.staggerListVertical(0);
          }
        ),
        body: AuthScreenBody
        (
          isRegister: false,
          greeting: JsonConsts.welcomeBack,
          lottieAsset: AssetsConsts.registerAsset,
          onSuccess: () =>  Functions().showSnackBar(context, 'success'),
        )
      )
    );
  }
}