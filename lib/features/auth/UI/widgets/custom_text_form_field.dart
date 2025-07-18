
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/features/auth/logic/password/password_visibility_cubit.dart';

import '../../../../core/utils/functions/functions.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, required this.hint, required this.controller, required this.type, this.obscureText = false,
  });
  final String hint;
  final TextEditingController controller;
  final TextInputType type;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField
    (
      controller: controller,
      keyboardType: type,
      obscureText: obscureText,
      validator: (value) 
      {
        if (type == TextInputType.visiblePassword) {
          return Functions().passwordValidator(value, context);
        }
        if (type == TextInputType.phone)
        {
          return Functions().phoneValidator(value, context);
        }
        return null;
      },
      decoration: InputDecoration
      (
        hintText: hint,
        suffixIcon: type == TextInputType.visiblePassword ? 
          InkWell
          (
            onTap: () => context.read<PasswordVisibilityCubit>().toggleVisibility(),
            child: Icon(obscureText? Iconsax.eye : Iconsax.eye_slash)
          ) : null
      ),
    );
  }
}
