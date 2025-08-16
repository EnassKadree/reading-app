import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/complaints/UI/widgets/unified_card.dart';
import 'package:reading_app/features/complaints/logic/complaints/complaints_cubit.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';
import '../../../shared/widgets/success_dialog.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ComplaintsCubit>();
    return BlocConsumer<ComplaintsCubit, ComplaintsState>(
      listener: (context, state) {
        if (state is ComplaintsFailure) {
          Functions().showSnackBar(context, state.message);
        } else if (state is ComplaintsSuccess) {
          _showSuccessDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return UnifiedCard(
          formKey: cubit.formKey,
          isLoading: state is ComplaintsLoading,
          title: JsonConsts.complaintAProblem.t(context),
          fields: [
            SetupProfileFormField(
                hint: JsonConsts.subject.t(context),
                controller: cubit.subject,
                icon: Iconsax.add,
                type: TextInputType.name),
            SetupProfileFormField(
                hint: JsonConsts.desc.t(context),
                controller: cubit.description,
                icon: Iconsax.subtitle,
                type: TextInputType.multiline),
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
          title: JsonConsts.complaintSentSuccessfully.t(context),
          desc: message),
    );
  }
}
