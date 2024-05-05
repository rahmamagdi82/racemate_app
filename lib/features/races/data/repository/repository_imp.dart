import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:racemate/core/errors/failure.dart';
import 'package:racemate/features/races/data/data_source/remote_data_source.dart';
import 'package:racemate/features/races/domain/entities/race_entity.dart';
import 'package:racemate/features/races/domain/repository/repository.dart';

class RacesRepositoryImp extends RacesRepository {
  final RacesRemoteDataSource racesRemoteDataSource;

  RacesRepositoryImp(
      {required this.racesRemoteDataSource,});

  @override
  Future<Either<Failure, List<RaceEntity>>> getRaces({required int page}) async {
    try{
      final List<RaceEntity> races = await racesRemoteDataSource.getRaces(page: page);
      return right(races);
    }
    catch(e){
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(message: e.toString(), ));
    }
  }
}