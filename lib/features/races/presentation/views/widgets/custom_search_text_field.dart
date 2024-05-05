import 'package:flutter/material.dart';
import 'package:racemate/core/utiles/resources/style_manager.dart';

import '../../../../../core/utiles/resources/color_manager.dart';
import '../../../../../core/utiles/resources/values_manager.dart';


class CustomSearchTextField extends StatelessWidget{
  const CustomSearchTextField({super.key, required this.onChanged, required this.hintText});
  final void Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: ColorManager.white,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIconColor: ColorManager.white,
        suffixIcon: IconButton(
          icon: Icon(Icons.search,color: ColorManager.blue1,),
          onPressed: () {  },
        ),
        hintText: hintText,
        hintStyle: FontStyles.getRegularStyle().copyWith(color: ColorManager.blue4),
        border: border,
        focusedBorder: border,
        enabledBorder: border
      ),
      onChanged: onChanged,
    );
  }
}

InputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: ColorManager.blue4,width: 2),
    borderRadius: BorderRadius.circular(AppSize.s8)
);