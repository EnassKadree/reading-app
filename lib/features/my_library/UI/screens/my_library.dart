import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body.dart';

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyLibraryBody());
  }
}
