part of 'get_races_cubit.dart';

abstract class GetRacesState {}

class GetRacesInitial extends GetRacesState {}
class GetRacesLoading extends GetRacesState {}
class GetRacesSuccess extends GetRacesState {
  final List<RaceEntity> races;
  GetRacesSuccess({required this.races});
}
class GetRacesFailed extends GetRacesState {
  final String message;
  GetRacesFailed({required this.message});

}
