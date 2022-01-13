import 'package:flutter/material.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/model/constants.dart';
import 'package:weather/servics/network.dart';
import 'package:weather/model/weathermodel.dart';
import 'package:weather/screen/searccity.dart';
import 'package:weather/servics/weather.dart';

class GetWeather extends StatefulWidget {
  var weatherdata;
  GetWeather({this.weatherdata});

  @override
  _GetWeatherState createState() => _GetWeatherState();
}

class _GetWeatherState extends State<GetWeather> {
 var temp;
 var city;
 var condition;
 var wethericon;
 var massage;
 late double dd;
   var datamodel;
   String cityyget='';

 void putdata(dynamic weatherdata){
   temp=weatherdata['main']['temp'];
   dd=temp-272.5;
   condition=weatherdata['weather'][0]['id'];
   city=weatherdata['name'];
   WeatherIcon model = WeatherIcon();
   wethericon = model.getWeatherIcon(condition);
   massage = model.getMessage(dd.toInt());

 }

 @override
  void initState() {
    // TODO: implement initState

  //  putdata(widget.weatherdata,temp,condition,city);
  setState(() {
    if(cityyget.isEmpty){
      putdata(widget.weatherdata);
    }else{
      putdata(datamodel);
    }
  });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.send,size: 40,color: Colors.white,)),
                    IconButton(onPressed: () async{
                  cityyget= await Navigator.of(context).push(MaterialPageRoute(builder: (e)=>SearchCity(
                )));
                 var url='https://api.openweathermap.org/data/2.5/weather?q=$cityyget&appid=0985670900617282c1508c6a3826f063';
                 NetworkHelper nh=NetworkHelper(url: url);
                 datamodel=await nh.getData();
                 print(datamodel);

                  widget.weatherdata=null;
                 // temp=datamodel['main']['temp'];
                 // dd=temp-272.5;
                 // condition=datamodel['weather'][0]['id'];
               //   city=datamodel['name'];
               setState(() {
                 putdata(datamodel);
               });

                 print(city);



                    },
                        icon: Icon(Icons.domain,size: 40,color: Colors.white,)),
                  ],
                ),
                SizedBox(height: 150,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [

                   Text('${dd.toStringAsFixed(1)}°',style: textStyle,),
                   SizedBox(width: 20,),
                   Text('${wethericon}',style:textStyle ,)
                 ],
               ),
                SizedBox(height: 150,),
                Text('${massage} $city',style: textStyle,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
