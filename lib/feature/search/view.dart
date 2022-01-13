import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/core/router/router.dart';
import 'package:weather/feature/search/cubit.dart';
import 'package:weather/feature/search/state.dart';
import 'package:weather/servics/weather.dart';

class SaarchView extends StatelessWidget {
   SaarchView({Key? key}) : super(key: key);

  var citycontoler=TextEditingController();
  var formkey=GlobalKey<FormState>();
   WeatherIcon model = WeatherIcon();

   @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context)=>SearchCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/city.jpg'),
                  fit: BoxFit.cover
              )
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Form(
              key: formkey,
              child: BlocBuilder<SearchCubit,SearchState>(
                builder: (context,state){
                  var cubit=SearchCubit.get(context);
                  var data=cubit.weather;
              return    Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 0),
                child: SingleChildScrollView(
                  child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: ()=>MagicRouter.pop(),
                                  icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,))),
                          SizedBox(height: 50,),
                          TextFormField(
                            validator: (r){
                              if(r!.isEmpty){
                                return 'Enter City name';
                              }
                              return  null;
                            },

                            controller: citycontoler,
                            style: TextStyle(color: Colors.black,fontSize: 20),
                            decoration: InputDecoration(
                                hintText: 'Enter City Name',
                                hintStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                icon: Icon(Icons.location_city,color: Colors.white,),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide.none
                                )
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextButton(
                              onPressed: () async{
                                if(formkey.currentState!.validate()){
                                 cubit.getWeatherByCity(citycontoler.text);
                                }
                              },
                              child: Text('Get Weather',style: textStyle,)),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [


                              Text('${(cubit.degree)?.toStringAsFixed(1)}°',style: textStyle,),
                              SizedBox(width: 20,),
                              // Text('${model.getWeatherIcon(cubit.id)}',style:textStyle ,)
                            ],
                          ),
                          SizedBox(height: 30,),
                          Text(' ${cubit.cityname}',style: textStyle,)
                        ],
                      ),
                ),
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
