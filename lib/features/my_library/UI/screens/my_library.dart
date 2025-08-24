import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/my_library_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/my_library/services/library_stats/library_stats_cubit.dart';

class MyLibraryPage extends StatelessWidget {
  const MyLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryStatsCubit()..getLibraryStats(),
      child: const Scaffold(
        body: MyLibraryBody(),
      ),
    );
  }
}

