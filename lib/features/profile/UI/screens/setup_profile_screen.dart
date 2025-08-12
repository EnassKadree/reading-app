import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/home/main_layout.dart';
import 'package:reading_app/features/profile/UI/widgets/setup_profile_header.dart';
import 'package:reading_app/features/profile/logic/setup/setup_profile_cubit.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';
import 'package:reading_app/features/shared/widgets/custom_button.dart';
import 'package:reading_app/features/shared/widgets/custom_progress_indicator.dart';

import '../widgets/setup_profile_form.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key, required this.isSetup});
  final bool isSetup;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupProfileCubit, SetupProfileState>(
      listener: (context, state) {
        if (state is SetupProfileSuccess) {
          if (isSetup) {
            context.pushAndRemoveAll(const MainLayoutWrapper());
          } else {
            context.pop();
            // ToDo: request new profile data
          }
        } else if (state is SetupProfileFailure) {
          Functions().showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        final cubit = context.read<SetupProfileCubit>();
        return Scaffold(
          backgroundColor: Colors.grey[50],
          bottomNavigationBar: CustomButton(
            title: JsonConsts.save.t(context),
            radius: 16,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.submit();
              }
            },
          ).mainPadding,
          body: SafeArea(
            child: CustomProgressIndicator(
              inAsyncCall: state is SetupProfileLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header
                    const SetupProfileHeader(),
                    // Form Section
                    SetupProfileForm(cubit: cubit)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SetupProfileScreenWrapper extends StatelessWidget {
  const SetupProfileScreenWrapper(
      {super.key, required this.isSetup, this.profile});
  final bool isSetup;
  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SetupProfileCubit(profile)..loadData())],
        child: SetupProfileScreen(isSetup: isSetup));
  }
}
