import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    super.key,
    this.imageFile,
    this.picture,
  });

  final File? imageFile;
  final String? picture;

  @override
  Widget build(BuildContext context) {
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
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: context.colorScheme.surface.withOpacity(.7),
          radius: 41,
          child: ClipOval(
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                    width: 82,
                    height: 82,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Iconsax.user,
                        color: context.colorScheme.primary,
                      );
                    },
                  )
                : picture != null && picture != ''
                    ? CustomNetworkImage(imageUrl: picture!)
                    : Icon(
                        Iconsax.user,
                        color: context.colorScheme.primary,
                      ),
          ),
        ),
      ),
    );
  }
}
