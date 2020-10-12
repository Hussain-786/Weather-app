import 'package:flutter/material.dart';
import 'variables.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/city_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                  onPressed: (){
                      Navigator.pop(context);
                  },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    onChanged: (value){
                      cityName = value;
                    },
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context, cityName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Get Weather',
                      style: kText,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}