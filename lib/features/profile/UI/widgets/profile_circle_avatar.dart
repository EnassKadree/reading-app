import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../shared/widgets/custom_network_image.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    super.key,
    // required this.avatar,
  });

  // final AvatarModel avatar;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<AccountController>();
    // return Obx(() {
    //   final File? imageFile = controller.pickedImage.value;
    //   final String avatarUrl = controller.profile?.avatar.preview ?? '';
    return Container(
      height: 104,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: context.colorScheme.surface.withOpacity(.2),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: context.colorScheme.surface,
          radius: 41,
          child: ClipOval(child: Image.asset(AssetsConsts.profileAsset2)
              // imageFile != null
              // ? Image.file(
              //     imageFile,
              //     fit: BoxFit.cover,
              //     width: MediaQuery.of(context).size.width / 5,
              //     height: MediaQuery.of(context).size.width / 5,
              //   )
              // : CustomNetworkImage(
              //     avatarUrl,
              //     fit: BoxFit.cover,
              //     width: MediaQuery.of(context).size.width / 5,
              //   ),
              ),
        ),
      ),
    );
    // });
  }
}
