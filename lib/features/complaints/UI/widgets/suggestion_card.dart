import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/complaints/UI/widgets/unified_card.dart';
import 'package:reading_app/features/complaints/logic/suggestions/suggestion_cubit.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';
import '../../../shared/widgets/success_dialog.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SuggestionCubit>();
    return BlocConsumer<SuggestionCubit, SuggestionState>(
      listener: (context, state) {
        if (state is SuggestionFailure) {
          Functions().showSnackBar(context, state.message);
        } else if (state is SuggestionSuccess) {
          _showSuccessDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return UnifiedCard(
          formKey: cubit.formKey,
          isLoading: state is SuggestionLoading,
          title: JsonConsts.suggestNewBook.t(context),
          fields: [
            SetupProfileFormField(
                hint: JsonConsts.title.t(context),
                controller: cubit.title,
                icon: Iconsax.book_1,
                type: TextInputType.name),
            SetupProfileFormField(
                hint: JsonConsts.authorName.t(context),
                controller: cubit.authorName,
                icon: Iconsax.user_edit,
                type: TextInputType.name),
            SetupProfileFormField(
                hint: JsonConsts.note.t(context),
                controller: cubit.note,
                icon: Iconsax.note_1,
                type: TextInputType.text),
          ],
          onSend: () {
            if (cubit.formKey.currentState!.validate()) {
            cubit.submit();
            }
          },
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
          title: JsonConsts.suggestionSentSuccessfully.t(context),
          desc: message),
    );
  }
}
