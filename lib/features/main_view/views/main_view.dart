import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racemate/features/main_view/views/widgets/custom_tab_bar_view.dart';

import '../../races/data/data_source/remote_data_source.dart';
import '../../races/data/repository/repository_imp.dart';
import '../../races/domain/use_cases/get_races_use_case.dart';
import '../../races/presentation/controllers/get_races_cubit.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_tab_bar.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: customAppBar(),
        body: const Column(
          children: [
            CustomTabBar(),
            Expanded(
              child: CustomTabBarView(),
            ),
          ],
        ),
      ),
    );
  }
}
