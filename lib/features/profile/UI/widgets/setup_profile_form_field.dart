import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/functions/functions.dart';

class SetupProfileFormField extends StatelessWidget {
  const SetupProfileFormField({
    super.key,
    required this.controller,
    this.maxLines = 1,
    required this.hint,
    required this.icon,
    this.type = TextInputType.name,
  });
  final TextEditingController controller;
  final int maxLines;
  final String hint;
  final IconData icon;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: type,
        validator: (value) {
          if (type == TextInputType.name) {
            return Functions().nameValidator(value, context);
          }
          if (type == TextInputType.multiline) {
            return Functions().multiLineValidator(value, context);
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: context.colorScheme.tertiary,
              size: 20,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 1, color: Colors.grey[300]!)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 1,
                    color: context.colorScheme.primary.withOpacity(.7)))));
  }
}
