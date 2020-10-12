import 'package:flutter/material.dart';
import 'weather.dart';
import 'variables.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {

final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String description;
  int temp;
  String city;
  int id;
  String icon;
  String msg;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  WeatherModel weatherModel = WeatherModel();
  void updateUI(dynamic weatherData){
    setState(() {
      if (weatherData == null) {
        temp = 0;
        icon = 'Error';
        msg = 'Unable to get weather data';
        city = '';
        return;
      }
      var weatherInfo = weatherData;
      temp = weatherInfo['main']['temp'].toInt();
      description = weatherInfo['weather'][0]['description'];
      city = weatherInfo['name'];
      id = weatherInfo['weather'][0]['id'];
      icon = weatherModel.getWeatherIcon(id);
      msg = weatherModel.getMessage(temp);
    });
  }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.liveLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var cityData = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }),);
                      if(cityData != null){
                        var weatherData = await weatherModel.cityWeather(cityData);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$temp°',
                    style: kLabelStyle,
                  ),
                  Text(
                    '$icon',
                    style: kConditionStyle,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Description : $description.',
                  style: kText,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'City : $city.',
                  style: kText,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  '$msg in $city.',
                  style: kText,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}