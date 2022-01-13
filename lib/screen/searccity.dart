import 'package:flutter/material.dart';
import 'package:weather/const/style/style.dart';
import 'package:weather/model/constants.dart';
import 'package:weather/servics/network.dart';

class SearchCity extends StatefulWidget {
  // var temp;
  // late double dd;
  // var condition;
  // var city;
  //
  // SearchCity({required this.temp,required this.dd,required this.city,required this.condition});

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {



  var citycontoler=TextEditingController();
  var formkey=GlobalKey<FormState>();
  var datamodel;
  late String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,))),
                SizedBox(height: 50,),
                TextFormField(
                  validator: (r){
                    if(r!.isEmpty){
                      return 'Enter City name';
                    }
                    return  null;
                  },
                  onChanged: (newdata){
                    city=newdata;
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
                        print(city);

                         //
                         //  widget.temp=datamodel['main']['temp'];
                         //  widget.dd=widget.temp-272.5;
                         // widget.condition=datamodel['weather'][0]['id'];
                         //  widget.city=datamodel['name'];


                        Navigator.of(context).pop(city);
                      }
                    },
                    child: Text('Get Weather',style: textStyle,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
