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
    this.height = 104,
    this.margin = 5,
    this.borderColor,
  });

  final File? imageFile;
  final String? picture;
  final double height;
  final double margin;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 5,
          color: borderColor?.withOpacity(.2) ??
              context.colorScheme.surface.withOpacity(.2),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(margin),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: context.colorScheme.surface.withOpacity(.7),
          radius: height / 2.5,
          child: ClipOval(
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    fit: BoxFit.cover,
                    width: height / 1.2,
                    height: height / 1.2,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Iconsax.user,
                        color: context.colorScheme.primary,
                      );
                    },
                  )
                : picture != null && picture != ''
                    ? CustomNetworkImage(
                        imageUrl: picture!,
                        height: height,
                        width: height,
                      )
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
