import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racemate/features/races/presentation/controllers/get_races_cubit.dart';

import '../../../../../core/utiles/resources/color_manager.dart';
import '../../../../../core/utiles/resources/style_manager.dart';
import '../../../../../core/utiles/resources/values_manager.dart';
import '../../../data/data_source/remote_data_source.dart';
import '../../../data/repository/repository_imp.dart';
import '../../../domain/use_cases/get_races_use_case.dart';
import 'custom_bottom_sheet.dart';


class FilterListItem extends StatefulWidget {
  const FilterListItem({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FilterListItem> createState() => _FilterListItemState();
}

class _FilterListItemState extends State<FilterListItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return const CustomBottomSheet();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: ColorManager.blue1),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: FontStyles.getMediumStyle().copyWith(color: ColorManager.blue1),
            ),
            const Icon(Icons.keyboard_arrow_down)
          ],
        ),
      ),
    );
  }
}
