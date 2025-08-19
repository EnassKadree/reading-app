import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/profile/UI/widgets/setup_profile_form_field.dart';
import 'package:reading_app/features/shared/widgets/custom_progress_indicator.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_white_container.dart';

class UnifiedCard extends StatelessWidget {
  const UnifiedCard(
      {super.key,
      required this.title,
      required this.fields,
      required this.onSend,
      required this.isLoading,
      required this.formKey});
  final String title;
  final bool isLoading;
  final List<SetupProfileFormField> fields;
  final void Function() onSend;
  final Key formKey;

  @override
  Widget build(BuildContext context) {
    return CustomProgressIndicator(
      inAsyncCall: isLoading,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomWhiteContainer(
                padding: const EdgeInsets.all(28),
                margin: const EdgeInsets.all(16),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: StylesConsts.f16W600Black,
                        ),
                        16.spaceH,
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              fields[index],
                          separatorBuilder: (BuildContext context, int index) =>
                              12.spaceH,
                          itemCount: fields.length,
                        ),
                        54.spaceH,
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            title: JsonConsts.send.t(context),
                            onPressed: () => onSend(),
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
