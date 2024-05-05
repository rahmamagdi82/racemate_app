import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../gen/assets.gen.dart';
import '../../../../core/utiles/resources/color_manager.dart';
import '../../../../core/utiles/resources/values_manager.dart';

AppBar customAppBar(){
  return AppBar(
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.blue1,
      statusBarIconBrightness: Brightness.light,
    ),
    flexibleSpace: Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.frame.path),
              fit: BoxFit.fill)),
    ),
    title: SvgPicture.asset(
      Assets.images.logo,
      width: AppSize.s115,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: badges.Badge(
          badgeStyle: badges.BadgeStyle(badgeColor: ColorManager.red2),
          position: badges.BadgePosition.topEnd(
              top: AppSize.s2, end: AppSize.s2),
          child: Icon(Icons.notifications, color: ColorManager.yellow2),
        ),
      ),
      IconButton(
          onPressed: () {},
          icon: CircleAvatar(
              backgroundColor: ColorManager.yellow2,
              child: Icon(
                Icons.person,
                color: ColorManager.blue1,
              ))),
    ],
  );
}