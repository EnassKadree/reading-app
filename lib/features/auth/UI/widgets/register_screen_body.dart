import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';


import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/cubit/register_cubit.dart';
import 'custom_text_form_field.dart';
import 'have_an_account_widget.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) 
  {
    int height = MediaQuery.of(context).size.height.toInt();
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) 
      {
        return Form
        (
          key: cubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: Functions().staggeredList
              ([
                (height~/10).spaceH,
                SvgPicture.asset(AssetsConsts.registerAsset, height: 150,),
                12.spaceH,
                Text(
                  JsonConsts.huroof.t(context),
                  style: StylesConsts.headerTxt,
                ),
                Text(
                  JsonConsts.welcome.t(context),
                  style: StylesConsts.descTxt,
                ),
                56.spaceH,
                CustomTextFormField(
                    hint: JsonConsts.email.t(context),
                    controller: cubit.emailController,
                    type: TextInputType.emailAddress,),
                14.spaceH,
                CustomTextFormField(
                    hint: JsonConsts.password.t(context),
                    controller: cubit.passwordController,
                    type: TextInputType.visiblePassword,
                    obscureText: state.isPasswordVisible,),
                12.spaceH,
                const HaveAnAccountWidget().horizontalPadding
              ],)
            ).mainPadding,
          ),
        );
      },
    );
  }
}
