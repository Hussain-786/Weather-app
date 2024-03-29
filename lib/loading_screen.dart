import 'package:flutter/material.dart';
import 'weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async{
    var localWeather = await weatherModel.liveLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: localWeather);
    },),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}