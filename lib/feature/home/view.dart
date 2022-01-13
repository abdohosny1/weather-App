import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/core/router/router.dart';
import 'package:weather/feature/home/cubit.dart';
import 'package:weather/feature/home/state.dart';
import 'package:weather/feature/search/view.dart';
import 'package:weather/screen/searccity.dart';
import 'package:weather/servics/weather.dart';

class HomeView extends StatelessWidget {
   HomeView({Key? key ,required this.lat,required this.lon}) : super(key: key);
   late double lat;
  late  double lon;
   WeatherIcon model = WeatherIcon();
   var citycontoler=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>WeatherCubit()..getCurrentWeather(lat,lon),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<WeatherCubit,WeatherState>(
                builder: (context,state){
                  final cubit=WeatherCubit.get(context);
                  final data=cubit.weather;

                  return state is LoadingWetherStete? Center(child: CircularProgressIndicator(),)
                  :Column
                    (
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.send,size: 40,color: Colors.white,)),

                          // IconButton(onPressed: (){},
                          //     icon: Icon(Icons.send,size: 40,color: Colors.white,)),
                          IconButton(onPressed: ()=>MagicRouter.navigateTo(SaarchView()),
                              icon: Icon(Icons.location_city_outlined,size: 40,color: Colors.white,)),

                        ],
                      ),
                      SizedBox(height: 150,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [


                          Text('${(data?.main?.temp)?.toStringAsFixed(1)}°',style: textStyle,),
                          SizedBox(width: 20,),
                          Text('${model.getWeatherIcon(data?.weather!.first.id!)}',style:textStyle ,)
                        ],
                      ),
                      SizedBox(height: 150,),
                      Text('${model.getMessage((data?.main?.temp)?.toInt())} ${data?.name}',style: textStyle,)
                    ],
                  );
                },

              ),
            ),
          ),
        ),
      ),
    );
  }
}
