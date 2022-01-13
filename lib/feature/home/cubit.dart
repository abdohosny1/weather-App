
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/dioHelper/dio_helper.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/core/models/weathermodel.dart';
import 'package:weather/feature/home/state.dart';

class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit() : super(InilizWetherStete());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  Weather? weather;
  WeatherModel? weatherModel;

  Future<void> getCurrentWeather(lat,lon) async {
    emit(LoadingWetherStete());
    try{
      final response = await DioHelper.get('lat=$lat&lon=$lon');
      // print("t=$lat");

     weather = Weather.fromJson(response.data);
     //  weatherModel = WeatherModel.fromjson(response.data);
      print("weather =$weather");

    }catch(e){
      print("error is ${e.toString()}");
    }
    emit(InilizWetherStete());
  }



}
