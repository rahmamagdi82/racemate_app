import 'package:fpdart/fpdart.dart';
import 'package:racemate/features/races/domain/entities/race_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class RacesRepository{
  Future<Either<Failure,List<RaceEntity>>> getRaces({required int page});
}