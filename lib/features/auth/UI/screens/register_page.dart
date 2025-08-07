import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import 'package:reading_app/features/auth/UI/widgets/auth_screen_body.dart';
import 'package:reading_app/features/auth/logic/password/password_visibility_cubit.dart';
import 'package:reading_app/features/auth/logic/register/register_cubit.dart';

import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../home/main_layout.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            body: AuthScreenBody
              (
              greeting: JsonConsts.welcome,
              lottieAsset: AssetsConsts.registerAsset,
              onSuccess: (){Functions().showSnackBar(context, 'success');
                context.pushReplacement(const MainLayoutWrapper());},
            )
        )
    );
  }
}