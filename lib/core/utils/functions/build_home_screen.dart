part of 'functions.dart';


extension BuildHomeScreen on Functions {
  Widget buildHomeScreen() {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, user) {
        if (user != null) {
          return const MainLayoutWrapper();
        }
        return const LoginPage();
      },
    );
  }
}
