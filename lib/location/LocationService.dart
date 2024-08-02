import 'package:location/location.dart';
import 'package:vacgom_app/location/LocationModel.dart';

class LocationService {
  Location location = new Location();

  Future<void> requestPermission() async {
    print("req");
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();

    print("service enabled: $_serviceEnabled");
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    print("service _permissionGranted: $_permissionGranted");
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    } else {
      return;
    }
  }

  Future<LocationModel> getLocation() async {
    await requestPermission();

    final loc = await location.getLocation();

    print(loc);
    return LocationModel(lat: loc.latitude!, lon: loc.longitude!);
  }
}
