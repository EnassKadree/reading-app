import 'package:flutter/material.dart';
import 'package:reading_app/features/shared/data/data_source.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/user/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final String registerEndPoint = '${EndPoint.baseUrl}${EndPoint.register}';
  final String loginEndPoint = '${EndPoint.baseUrl}${EndPoint.login}';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> submit({required bool isRegister}) async {
    emit(RegisterLoading());
    await executeWithCatch(
        action: () async {
          // final prefs = await SharedPreferences.getInstance();
          // String? fcmToken = prefs.getString('fcm_token');
          Map<String, dynamic> body = {
            'email': emailController.text,
            'password': passwordController.text,
           // "fcm_token": fcmToken ?? " "
          };
          Map<String, dynamic> response = await Api().postWithoutTokenWithBody(
              url: isRegister ? registerEndPoint : loginEndPoint, body: body);
          User user = User.fromMap(response);
          DataSource().saveUser(user);
          emit(RegisterSuccess(response));
        },
        emit: emit,
        failureStateBuilder: (message) => RegisterFailure(message));
  }
}
