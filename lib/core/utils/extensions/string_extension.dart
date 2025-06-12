import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart' as intl;
import 'package:easy_localization/easy_localization.dart';

import '../../../features/shared/localization/app_localization.dart';


extension StringExtension on String? {
  //translate
  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this!) ?? '';
  }

  bool get isNumeric => num.tryParse(this!) != null ? true : false;

  String get dateIsNull => this ?? DateTime.now().toString();

  //convert image to base64
  Uint8List get base64ToImage {
    final UriData? data = Uri.parse(this!).data;
    Uint8List myImage = data!.contentAsBytes();
    return myImage;
  }

  //confirm format date
  String get dateOrder =>
      DateFormat('MM/dd/yyyy').format(DateTime.parse(this!));

  String get priceOrder =>
      intl.NumberFormat.decimalPattern().format(double.parse(this!));

  DateTime get convertToDate => DateTime.utc(
        int.parse(this!.split(" ").first.split("-")[0]),
        int.parse(this!.split(" ").first.split("-")[1]),
        int.parse(this!.split(" ").first.split("-")[2]),
      );
}
