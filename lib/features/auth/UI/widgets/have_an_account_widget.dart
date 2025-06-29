
import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/auth/UI/screens/login_page.dart';
import 'package:reading_app/features/auth/UI/screens/register_page.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key, this.isRegister = true,
  });
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.start,
      children: 
      [
        Text
        (
          (isRegister? JsonConsts.haveAnAccount : JsonConsts.dontHaveAnAccount).t(context),
          style: StylesConsts.descTxt,
        ),
        8.spaceW,
        InkWell
        (
          onTap: () {
            if(isRegister) {context.pushAndRemoveAll(const LoginPage());}
            else {context.pushAndRemoveAll(const RegisterPage());}
          },
          child: Text
          (
            (isRegister? JsonConsts.login : JsonConsts.register).t(context),
            style: StylesConsts.descTxt.copyWith(color: Colors.blue),
          ),
        )
      ],
    );
  }
}
