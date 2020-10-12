import 'variables.dart';
import 'networking.dart';
import 'location.dart';

class WeatherModel {

  Location location = Location();
  Future<dynamic> liveLocation() async {
    await location.getLocation();
    Networking networking = Networking(url: '$openWeatherMap?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> cityWeather(String cityData) async {
    Networking networking = Networking(url: 'http://api.openweathermap.org/data/2.5/weather?q=$cityData&appid=$apiKey&units=metric');
    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

}