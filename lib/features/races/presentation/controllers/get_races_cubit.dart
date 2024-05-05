import 'package:bloc/bloc.dart';
import 'package:racemate/features/races/domain/use_cases/get_races_use_case.dart';

import '../../domain/entities/race_entity.dart';

part 'get_races_state.dart';

class GetRacesCubit extends Cubit<GetRacesState> {
  GetRacesCubit(this.getRacesUseCase) : super(GetRacesInitial());
  final GetRacesUseCase getRacesUseCase;
  Future<void> getRaces(int page) async{
    emit(GetRacesLoading());
    var races = await getRacesUseCase.call(page);
    races.fold((failure) {
      emit(GetRacesFailed(message: failure.message));

    }, (races) => emit(GetRacesSuccess(races: races)));
  }

  Future<void> search(String searchWord) async{
    emit(GetRacesLoading());
    var races = await getRacesUseCase.call(1);
    races.fold((failure) {
      emit(GetRacesFailed(message: failure.message));
    }, (races) {
      List<RaceEntity> result = races.where((element) => element.name.toLowerCase().contains(searchWord.toLowerCase()) || element.country.toLowerCase().contains(searchWord.toLowerCase())).toList();
      emit(GetRacesSuccess(races: result));
    } );
  }


  Future<void> filterWithLocation(List<String> locations) async{
    emit(GetRacesLoading());
    List<RaceEntity> result = [];
    var races = await getRacesUseCase.call(1);
    races.fold((failure) {
      emit(GetRacesFailed(message: failure.message));
    }, (races) {
      locations.forEach((location) {
        result.addAll(races.where((race) => race.country.toLowerCase()==location.toLowerCase()).toList());

      });
      print(result);

      emit(GetRacesSuccess(races: result));


    } );
  }
}
