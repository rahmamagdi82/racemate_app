import 'package:flutter/material.dart';
import '../../../../../core/utiles/resources/values_manager.dart';
import 'filter_list_item.dart';

class FiltersList extends StatefulWidget {
  const FiltersList({Key? key}) : super(key: key);

  @override
  State<FiltersList> createState() => _FiltersListState();
}

class _FiltersListState extends State<FiltersList> {
  List<String> titles = ['Type','Location','Distance','Date'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: titles.length,
          itemBuilder: (context,index){
            return FilterListItem(title: titles[index],);
          }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: AppSize.s15,);
      },),
    );
  }
}
