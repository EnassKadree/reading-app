import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

import 'package:reading_app/features/auth/UI/widgets/register_screen_body.dart';
import 'package:reading_app/features/auth/logic/cubit/register_cubit.dart';
import 'package:reading_app/features/shared/widgets/custom_button.dart';

import '../../../../core/utils/constants/json_consts.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return BlocProvider
    (
      create: (context) => RegisterCubit(),
      child: Scaffold
      (
        bottomNavigationBar: CustomOutlinedButton
        (
          title: JsonConsts.register,
          onPressed: (){},
        ).mainPadding,
        body: const RegisterScreenBody()
      )
    );
  }
}