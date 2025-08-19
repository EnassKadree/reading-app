import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/shared/widgets/custom_progress_indicator.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/register/register_cubit.dart';
import 'auth_form.dart';
import 'background_container.dart';
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
          child: SingleChildScrollView(
            child: Stack
            (
              children: [
                Positioned.fill
                (
                  child: BackgroundContainer
                  (
                    height: height * .75,
                  ),
                ),
                Column(
                children: Functions().staggeredList(
                [
                  (height ~/ 10).spaceH,
                  Text(
                    JsonConsts.huroof.t(context),
                    style: StylesConsts.headerTxt.copyWith(color: context.colorScheme.surface),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  32.spaceH,
                  Text(
                    greeting.t(context),
                    style: StylesConsts.descTxt,
                  ),
                  56.spaceH,
                  AuthForm(cubit: cubit, isRegister: isRegister),
                  32.spaceH,
                  HaveAnAccountWidget(isRegister: isRegister).horizontalPadding
                ],
                )).mainPadding,
              ],
            ),
          ),
        );
      },
    );
  }
}
