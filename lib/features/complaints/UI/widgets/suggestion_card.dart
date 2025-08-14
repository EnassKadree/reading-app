import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/complaints/UI/widgets/unified_card.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnifiedCard(title: JsonConsts.suggestNewBook.t(context), fields: [
      SetupProfileFormField(
          hint: JsonConsts.title.t(context),
          controller: TextEditingController(),
          icon: Iconsax.book_1,
          type: TextInputType.text),
      SetupProfileFormField(
          hint: JsonConsts.authorName.t(context),
          controller: TextEditingController(),
          icon: Iconsax.user_edit,
          type: TextInputType.name),
      SetupProfileFormField(
          hint: JsonConsts.note.t(context),
          controller: TextEditingController(),
          icon: Iconsax.note_1,
          type: TextInputType.text),
      ],
      onSend: (){},
    );
  }
}
