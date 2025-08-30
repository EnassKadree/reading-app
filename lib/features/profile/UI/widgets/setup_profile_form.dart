import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/profile/logic/setup/setup_profile_cubit.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import 'setup_profile_form_field.dart';

class SetupProfileForm extends StatelessWidget {
  const SetupProfileForm({super.key, required this.cubit});
  final SetupProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: Functions().staggeredList([
            _buildSectionTitle(JsonConsts.personalInformation.t(context)),
            16.spaceH,
            SetupProfileFormField(
              controller: cubit.firstNameController,
              hint: JsonConsts.firstName.t(context),
              icon: Iconsax.user,
            ),
            16.spaceH,
            SetupProfileFormField(
              controller: cubit.lastNameController,
              hint: JsonConsts.lastName.t(context),
              icon: Iconsax.user,
            ),
            16.spaceH,
            SetupProfileFormField(
              controller: cubit.nicknameController,
              hint: JsonConsts.nickName.t(context),
              icon: Iconsax.emoji_happy,
            ),
            24.spaceH,
            _buildSectionTitle(JsonConsts.aboutYou.t(context)),
            16.spaceH,
            SetupProfileFormField(
              controller: cubit.bioController,
              hint: JsonConsts.bio.t(context),
              icon: Iconsax.paperclip,
              maxLines: 2,
              type: TextInputType.text,
            ),
            16.spaceH,
            SetupProfileFormField(
              controller: cubit.quoteController,
              hint: JsonConsts.favoriteQuote.t(context),
              icon: Iconsax.quote_down,
              maxLines: 2,
              type: TextInputType.text,
            ),
            32.spaceH
          ]),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: StylesConsts.f18W600Black.copyWith(),
    );
  }
}
