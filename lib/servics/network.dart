import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkHelper{
  late String url;
  NetworkHelper({ required this.url});


 Future<dynamic> getData() async{

    var localurl=Uri.parse(url);
    Response response= await get(localurl);
    var decodedData=null;
    if(response.statusCode==200){
      String data=response.body;
      print('check data is $data');
      decodedData=jsonDecode(data);
    }else{
      print('response . status${response.statusCode}');
    }
    return decodedData;

  }


}