import 'package:geolocator/geolocator.dart';

class FindLocation{
  late double lat;
   late double long;

     Future<void> findLocation() async{
    try{
      Position position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat=position.latitude;
      long=position.longitude;
      print(position);
      print(lat);
      print(long);

    }catch(e){

    }
  }

}