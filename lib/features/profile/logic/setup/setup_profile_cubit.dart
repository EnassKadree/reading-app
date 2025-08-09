import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../shared/user/user_model.dart';

part 'setup_profile_state.dart';

class SetupProfileCubit extends BaseCubit<SetupProfileState> {
  SetupProfileCubit() : super(SetupProfileInitial());

  final String setupProfileEndPoint =
      '${EndPoint.baseUrl}${EndPoint.setupProfile}';
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController quoteController = TextEditingController();

  File? selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImage = File(image.path);
        emit(SetupProfileImagePicked(selectedImage!));
      }
    } catch (e) {
      emit(SetupProfileFailure('Failed to pick image from camera: $e'));
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );
      if (image != null) {
        selectedImage = File(image.path);
        emit(SetupProfileImagePicked(selectedImage!));
      }
    } catch (e) {
      emit(SetupProfileFailure('Failed to pick image from gallery: $e'));
    }
  }

  Future<void> submit() async {
    emit(SetupProfileLoading());
    await executeWithCatch(
        action: () async {
          User? user = await requireUser();

          // Prepare text fields
          Map<String, String> fields = {
            'first_name': firstNameController.text,
            'last_name': lastNameController.text,
            'bio': bioController.text,
            'nickname': nicknameController.text,
            'quote': quoteController.text,
          };

          // Prepare files if image is selected
          Map<String, File> files = {};
          if (selectedImage != null) {
            files['picture'] = selectedImage!;
          }

          if (files.isNotEmpty) {
            await Api().postWithFile(
              url: setupProfileEndPoint,
              fields: fields,
              files: files,
              token: user.accessToken,
            );
          } else {
            await Api().post(
              url: setupProfileEndPoint,
              body: fields,
              token: user.accessToken,
            );
          }

          emit(SetupProfileSuccess());
        },
        emit: emit,
        failureStateBuilder: (message) => SetupProfileFailure(message));
  }
}
