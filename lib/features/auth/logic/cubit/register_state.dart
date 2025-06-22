part of 'register_cubit.dart';

class RegisterState 
{
  final bool isLoading;
  final bool isPasswordVisible;
  final String? errorMessage;

  RegisterState({
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.errorMessage,
  });

  RegisterState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    String? errorMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage,
    );
  }
}
