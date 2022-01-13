import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/model/constants.dart';
import 'package:weather/servics/location.dart';
import 'package:weather/servics/network.dart';

import 'getweather.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

 void getLocation() async{
    FindLocation fn=FindLocation();
    var location= await fn.findLocation();
    var api= '0985670900617282c1508c6a3826f063';
    String url='http://api.openweathermap.org/data/2.5/weather?lat=${fn.lat}&lon=${fn.long}&appid=$api';
    NetworkHelper h=NetworkHelper(url: url);
    var weatherdata=await h.getData();
    Navigator.of(context).push(MaterialPageRoute(builder: (e){
    return  GetWeather(weatherdata: weatherdata,);
    }));

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Find Location',style: textStyle),
          SizedBox(height: 40,),
          SpinKitDoubleBounce(
            color: Colors.white,
            size: 80,
          )
        ],
      ),
    );
  }
}
