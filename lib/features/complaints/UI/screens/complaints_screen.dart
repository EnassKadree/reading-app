import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/complaints/UI/widgets/complaint_card.dart';
import 'package:reading_app/features/complaints/logic/complaints/complaints_cubit.dart';

import '../../logic/suggestions/suggestion_cubit.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/suggestion_card.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            54.spaceH,
            Text(
              JsonConsts.connectWithAdmins.t(context),
              style: const TextStyle(fontSize: 20),
            ).horizontalPadding,
            Text(
              JsonConsts.yourPlace.t(context),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              maxLines: 2,
            ).horizontalPadding,
            16.spaceH,
            CustomTabBar(
              tabs: [
                Tab(text: JsonConsts.suggestions.t(context)),
                Tab(text: JsonConsts.complaints.t(context)),
              ],
            ).verticalPadding.staggerListVertical(0),
            const Expanded(
                child:
                    TabBarView(children: [SuggestionCard(), ComplaintCard()])),
          ],
        ),
      ),
    );
  }
}

class ComplaintsScreenWrapper extends StatelessWidget {
  const ComplaintsScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => SuggestionCubit()),
      BlocProvider(create: (context) => ComplaintsCubit()),
    ], child: const ComplaintsScreen());
  }
}
