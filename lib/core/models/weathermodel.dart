
class WeatherModel{

  Main? main;
  String? name;

  WeatherModel.fromjson(Map<String,dynamic> json){
    name=json["name"];
    main: Main.fromjson(json["main"]);


  }

  Map<String,dynamic>tojson(){
    final data=Map<String,dynamic>();

    //  data['key']=this.key;
    data['temp']=this.name;
    // data['main']=this.main;

    return data;
  }

}

class Main{
  double? temp;
  Main.fromjson(Map<String,dynamic> json){
    temp=json["temp"];


  }

  Map<String,dynamic>tojson(){
    final data=Map<String,dynamic>();

    //  data['key']=this.key;
    data['temp']=this.temp;

    return data;
  }
}