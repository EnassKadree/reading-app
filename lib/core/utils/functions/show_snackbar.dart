part of 'functions.dart';

extension ShowSnackbar on Functions
{
  void showSnackBar(BuildContext context, String message) 
  {
    ScaffoldMessenger.of(context).showSnackBar
    (
      SnackBar(content: Text(message), showCloseIcon: true,)
    );
  }
}
