import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/colors_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../logic/setup/setup_profile_cubit.dart';
import 'profile_circle_avatar.dart';

class SetupProfileHeader extends StatelessWidget {
  const SetupProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupProfileCubit, SetupProfileState>(
      builder: (context, state) {
        final cubit = context.read<SetupProfileCubit>();
        File? selectedImage;

        if (state is SetupProfileImagePicked) {
          selectedImage = state.image;
        }

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ColorsConsts.gradientColors),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: Functions().staggeredList([
                Text(
                  JsonConsts.setupProfile.t(context),
                  style: StylesConsts.f18W600White.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                24.spaceH,
                // Profile Picture Section
                GestureDetector(
                  onTap: () => _showImagePickerDialog(context, cubit),
                  child: Stack(
                    children: [
                      ProfileCircleAvatar(
                        imageFile: selectedImage,
                        picture: cubit.pictureUrl ?? '',
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: context.colorScheme.tertiary.withOpacity(.9),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Iconsax.camera,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                16.spaceH,
                Text(
                  JsonConsts.changePhoto.t(context),
                  style: StylesConsts.f15W400Grey.copyWith(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  void _showImagePickerDialog(BuildContext context, SetupProfileCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          JsonConsts.choosePhoto.t(context),
          style: StylesConsts.f18W600Black.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Iconsax.camera, color: Colors.blue),
              title: Text(JsonConsts.takeAPhoto.t(context)),
              onTap: () {
                Navigator.pop(context);
                cubit.pickImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.gallery, color: Colors.green),
              title: Text(JsonConsts.chooseFromGallery.t(context)),
              onTap: () {
                Navigator.pop(context);
                cubit.pickImageFromGallery();
              },
            ),
          ],
        ),
      ),
    );
  }
}
