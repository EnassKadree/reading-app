import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';

class SomeThingWentWrongWidget extends StatelessWidget {
  const SomeThingWentWrongWidget({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'حدث خطأ ما!',
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
            'إعادة المحاولة',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
