import 'package:flutter/material.dart';

import '../../../races/presentation/views/races_view_body.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Center(
          child: Text("RUN"),
        ),
        Center(
          child: Text("COMMUNITY"),
        ),
        RacesViewBody(),
      ],
    );
  }
}
