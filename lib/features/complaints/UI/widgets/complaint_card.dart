import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/complaints/UI/widgets/unified_card.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedCard(
      title: JsonConsts.complaintAProblem.t(context),
      fields: [
        SetupProfileFormField(
            hint: JsonConsts.subject.t(context),
            controller: TextEditingController(),
            icon: Iconsax.add,
            type: TextInputType.text),
        SetupProfileFormField(
            hint: JsonConsts.desc.t(context),
            controller: TextEditingController(),
            icon: Iconsax.subtitle,
            type: TextInputType.text),
      ],
      onSend: () {},
    );
  }
}
