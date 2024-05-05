import 'package:flutter/material.dart';
import 'package:racemate/core/utiles/resources/font_manager.dart';

import '../../../../../core/utiles/resources/style_manager.dart';
import '../../../../../core/utiles/resources/values_manager.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key, required this.text, this.fontSize, required this.fontColor, required this.backgroundColor, required this.onPressed});
  final String text;
  final double? fontSize;
  final Color fontColor;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s48,
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s8))
              )
          ),
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: FontStyles.getSemiBoldStyle(fontSize: FontSize.s14)
                .copyWith(fontSize: fontSize, color: fontColor),
          )),
    );
  }
}