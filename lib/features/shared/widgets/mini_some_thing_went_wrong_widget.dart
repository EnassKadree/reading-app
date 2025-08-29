import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

class MiniSomeThingWentWrongWidget extends StatelessWidget {
  const MiniSomeThingWentWrongWidget({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            JsonConsts.someThingWentWrong.t(context),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: ColorsConsts.purple),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: Text(
              JsonConsts.tryAgain.t(context),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color:context.colorScheme.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}