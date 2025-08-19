import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/shadows_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../logic/password/password_visibility_cubit.dart';
import '../../logic/register/register_cubit.dart';
import 'custom_text_form_field.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.cubit,
    required this.isRegister,
  });

  final RegisterCubit cubit;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: ShadowsConsts.xl3,
          color: context.colorScheme.surface),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: Functions().staggeredList([
            32.spaceH,
            Text(
                isRegister
                    ? JsonConsts.registerAccount.t(context)
                    : JsonConsts.loginAccount.t(context),
                style: StylesConsts.f23W600Yellow
                    .copyWith(color: context.colorScheme.onSurface)),
            32.spaceH,
            CustomTextFormField(
              hint: JsonConsts.email.t(context),
              controller: cubit.emailController,
              type: TextInputType.emailAddress,
            ),
            24.spaceH,
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
            72.spaceH,
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: isRegister ? JsonConsts.register : JsonConsts.login,
                onPressed: () {
                  context.read<RegisterCubit>().submit(isRegister: isRegister);
                },
              ),
            ),
            16.spaceH
          ]),
        ),
      ),
    );
  }
}
