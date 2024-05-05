import 'package:flutter/material.dart';
import '../../../../../core/utiles/resources/color_manager.dart';
import '../../../../../core/utiles/resources/font_manager.dart';
import '../../../../../core/utiles/resources/style_manager.dart';
import '../../../../../core/utiles/resources/values_manager.dart';
import 'custom_button.dart';
import 'custom_search_text_field.dart';

class CustomBottomSheet extends StatefulWidget{
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  List<bool> _checkboxValues = [false, false, false, false, false, false, false];
  List<String> countries = ['Near my location','Egypt','France (7)','Germany (9)','Greece (4)','Italy (9)','Kuwait (2)'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Race location'.toUpperCase(),style: FontStyles.getSemiBoldStyle().copyWith(color: ColorManager.blue1),),
              TextButton(onPressed: (){}, child: Text('Reset',style: FontStyles.getSemiBoldStyle(fontSize: FontSize.s14).copyWith(color: ColorManager.orange1),)),
            ],
          ),
          CustomSearchTextField(
            onChanged: (value){},
            hintText: 'Search',
          ),
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _checkboxValues.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(countries[index]),
                  value: _checkboxValues[index],
                  onChanged: (value) {
                    setState(() {
                      _checkboxValues[index] = value!;
                    });
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 2,color: ColorManager.blue4,);
              },
            ),
          ),
          CustomButton(
            text: 'done',
            fontColor: ColorManager.blue1,
            backgroundColor: ColorManager.yellow2,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  List<String> getLocations(){
    List<String> locations = [];
    for(int i=0; i<_checkboxValues.length; i++) {
      if(_checkboxValues[i]){
        locations.add(countries[i]);
      }
    }
    return locations;
  }
}
