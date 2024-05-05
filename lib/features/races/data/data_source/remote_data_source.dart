import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:racemate/features/races/data/models/race_model.dart';
import 'package:racemate/gen/assets.gen.dart';

abstract class RacesRemoteDataSource{
  Future<List<RaceModel>> getRaces({required int page});
}

class RacesRemoteDataSourceImp extends RacesRemoteDataSource{
  @override
  Future<List<RaceModel>> getRaces({required int page}) async {
    String jsonString = await rootBundle.loadString(Assets.json.racesData);
    var result = [];
    for(int i=0 ; i< page ; i++){
      result.add(json.decode(jsonString));
    }
    return getList(result);
  }

  List<RaceModel> getList(var result){
    List<RaceModel> races = [];
    for(int i=0 ; i< result.length ; i++) {
      for (var element in result[i]) {
        races.add(RaceModel.fromJson(element));
      }
    }
    return races;
  }

}