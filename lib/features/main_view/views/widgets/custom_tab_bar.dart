import 'package:flutter/material.dart';

import '../../../../core/utiles/resources/color_manager.dart';
import '../../../../core/utiles/resources/font_manager.dart';
import '../../../../core/utiles/resources/style_manager.dart';
import '../../../../core/utiles/resources/values_manager.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.blue1,
      child: TabBar(
        indicatorColor: ColorManager.yellow2,
        indicatorWeight: AppSize.s5,
        unselectedLabelColor: ColorManager.blue4,
        labelStyle: FontStyles.getBoldStyle(),
        unselectedLabelStyle:
        FontStyles.getBoldStyle(fontSize: FontSize.s18),
        tabs:  const [
          CustomTab(text: 'RUN',),
          CustomTab(text: 'COMMUNITY',),
          CustomTab(text: 'RACES',),
        ],
      ),
    );
  }
}
class CustomTab extends StatelessWidget{
  const CustomTab({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Tab(
        text: text,
      ),
    );
  }
}


