import 'package:geolocator/geolocator.dart';
import 'variables.dart';

Position position;

class Location{

    void getLocation() async {
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
