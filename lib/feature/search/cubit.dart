import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/dioHelper/dio_helper.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/feature/search/state.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInit());

  static SearchCubit get(context)=>BlocProvider.of(context);

  Weather? weather;
  String? cityname="";
  double? degree=0;
  int? id ;
  Future<void> getWeatherByCity(String city) async {
    emit(SearchLoading());
    try{
      final response = await DioHelper.get('q=$city');
      print("t=$response");

      weather = Weather.fromJson(response.data);
      print("city =$weather");
      degree=weather?.main?.temp;
      cityname=weather?.name!;
      id=weather?.weather?.first.id!;

    }catch(e){
      print("error is ${e.toString()}");
    }
    emit(SearchInit());
  }

}