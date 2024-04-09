import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapModelService {
  // controller
  late MapController mapController = MapController();

  // latlng
  LatLng userCurrentLocation(Position position) =>
      LatLng(position.latitude, position.longitude);

  LatLng standartLocation = const LatLng(40.5480, 34.9530);

  // google maps
  Uri googleMaps(String url) => Uri.parse(url);

  // phone call
  Uri launchPhoneNumberUrl(String phoneNumberValue) => Uri(
        scheme: 'tel',
        path: phoneNumberValue,
      );
}
