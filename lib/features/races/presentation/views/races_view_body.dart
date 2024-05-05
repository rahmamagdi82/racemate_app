import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racemate/features/races/data/data_source/remote_data_source.dart';
import 'package:racemate/features/races/data/repository/repository_imp.dart';
import 'package:racemate/features/races/domain/use_cases/get_races_use_case.dart';
import 'package:racemate/features/races/presentation/controllers/get_races_cubit.dart';
import 'package:racemate/features/races/presentation/views/widgets/bloc_builder_list_view.dart';
import 'package:racemate/features/races/presentation/views/widgets/custom_search_text_field.dart';
import 'package:racemate/features/races/presentation/views/widgets/filters_list.dart';

import '../../../../core/utiles/resources/values_manager.dart';

class RacesViewBody extends StatelessWidget {
  const RacesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetRacesCubit(GetRacesUseCase(RacesRepositoryImp(racesRemoteDataSource: RacesRemoteDataSourceImp())))..getRaces(1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:AppPadding.p16),
        child: Column(
          children: [
            const SizedBox(height: AppSize.s16,),
            BlocBuilder<GetRacesCubit,GetRacesState>(
              builder: (BuildContext context, state) {
                return CustomSearchTextField(onChanged: (value){
                  BlocProvider.of<GetRacesCubit>(context).search(value);
                }, hintText: 'Search Race Name or Country',);
              },
            ),
            const SizedBox(height: AppSize.s20,),
            const FiltersList(),
            const SizedBox(height: AppSize.s8,),
            const BlocBuilderListView(),
          ],
        ),
      ),
    );
  }
}
