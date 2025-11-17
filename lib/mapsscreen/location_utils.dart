import 'package:location/location.dart';

class LocationUtils{
  Future<LocationData> getUserLocation() async{
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Future.error("GPS is not enabled in device. Kindly enable from popup or app settings.");
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Future.error("Location permission was not granted");
      }
    }

    locationData = await location.getLocation();


    return Future.value(locationData);
  }
}