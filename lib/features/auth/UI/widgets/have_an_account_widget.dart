
import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row
    (
      mainAxisAlignment: MainAxisAlignment.start,
      children: 
      [
        Text
        (
          JsonConsts.haveAnAccount.t(context),
          style: StylesConsts.descTxt,
        ),
        8.spaceW,
        Text
        (
          JsonConsts.login.t(context),
          style: StylesConsts.descTxt.copyWith(color: Colors.blue),
        )
      ],
    );
  }
}
