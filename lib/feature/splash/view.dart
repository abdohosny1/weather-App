import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/core/location_service/location_service.dart';
import 'package:weather/core/router/router.dart';
import 'package:weather/feature/home/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  void getLocation()async{
  var loc=await  LocationServices.getCurrentLocation();
  print(loc.longitude);
  print(loc.latitude);
  MagicRouter.navigateTo(HomeView(lat:loc.latitude,lon: loc.longitude,));
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
