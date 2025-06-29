import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/auth/logic/password/password_visibility_cubit.dart';
import 'package:reading_app/features/shared/widgets/custom_progress_indicator.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/register/register_cubit.dart';
import 'custom_text_form_field.dart';
import 'have_an_account_widget.dart';

class AuthScreenBody extends StatelessWidget {
  const AuthScreenBody({
    super.key, required this.onSuccess, required this.greeting, required this.lottieAsset, this.isRegister = true,
  });
  final void Function() onSuccess;
  final String greeting;
  final String lottieAsset;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    final cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state)
      {
        if(state is RegisterFailure)
        {Functions().showSnackBar(context, state.message);}
        if(state is RegisterSuccess)
        {onSuccess();}
      },
      builder: (context, state) 
      {
        return CustomProgressIndicator
        (
          inAsyncCall: state is RegisterLoading,
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                  children: Functions().staggeredList(
                [
                  (height ~/ 10).spaceH,
                  Lottie.asset(lottieAsset, height: 200),
                  12.spaceH,
                  Text(
                    JsonConsts.huroof.t(context),
                    style: StylesConsts.headerTxt,
                  ),
                  Text(
                    greeting.t(context),
                    style: StylesConsts.descTxt,
                  ),
                  56.spaceH,
                  CustomTextFormField(
                    hint: JsonConsts.email.t(context),
                    controller: cubit.emailController,
                    type: TextInputType.emailAddress,
                  ),
                  14.spaceH,
                  BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, passwordState) {
                      return CustomTextFormField(
                        hint: JsonConsts.password.t(context),
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        obscureText: passwordState,
                      );
                    },
                  ),
                  12.spaceH,
                  HaveAnAccountWidget(isRegister: isRegister).horizontalPadding
                ],
              )).mainPadding,
            ),
          ),
        );
      },
    );
  }
}
