part of 'functions.dart';

extension InputValidator on  Functions
{
  // String? nameValidator(String? value, BuildContext context) 
  // {
  //   if (value == null || value.isEmpty) {
  //     return JsonConstants.required.t(context);
  //   } else if (value.length < 2) {
  //     return JsonConstants.shortName.t(context);
  //   } else if (value.length > 20) {
  //     return JsonConstants.longName.t(context);
  //   } else {
  //     return null;
  //   }
  // }

  String? passwordValidator(String? value, BuildContext context) 
  {
    if (value == null || value.isEmpty) {
      return JsonConsts.required;
    } else if (value.length < 8) {
      return JsonConsts.passwordShort;
    } else if (value.length > 20) {
      return JsonConsts.passwordLong;
    } else {
      return null;
    }
  }

  String? phoneValidator(String? value, BuildContext context) 
  {
    final RegExp phoneRegex = RegExp(
      r"^(?:\+963|00963|0)?9\s?\d{3}\s?\d{3}\s?\d{2}$|^(?:\+963|00963|0)?(1[1-9]|2[1-9]|3[1-9]|4[1-3])\s?\d{2,3}\s?\d{2,3}\s?\d{2}$"
    );
    
    if (value == null || value.isEmpty) {
      return JsonConsts.required;
    } 
    else if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'\s'), ''))) {
      return JsonConsts.invalidPhoneNumber;
    } 
    else {
      return null;
    }
  }
}
