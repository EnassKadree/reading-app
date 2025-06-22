import 'package:flutter/material.dart';

import '../../../../core/utils/base/base_cubit.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(RegisterState());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void togglePasswordVisibility() 
  {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> submit(String phone, String password) async 
  {
      
  }
}
