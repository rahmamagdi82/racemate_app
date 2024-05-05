import 'package:fpdart/fpdart.dart';
import 'package:racemate/features/races/domain/entities/race_entity.dart';
import 'package:racemate/features/races/domain/repository/repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

class GetRacesUseCase extends UseCase<List<RaceEntity>,int>{
  final RacesRepository racesRepository;

  GetRacesUseCase(this.racesRepository);

  @override
  Future<Either<Failure, List<RaceEntity>>> call([int? params]) async {
    return await racesRepository.getRaces(page: params!);
  }
}