import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Marker> _markers = {};

  GoogleMapController mapController;
  //final LatLng _center = const LatLng(45.521563, -122.677433);
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        tooltip: 'Get Location',
        child: Icon(Icons.flag),
      ),
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
      ),
      body: GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(40.688841, -74.044015),
              zoom: 11,
            ),
            markers: _markers.values.toSet(),
      ),
    );
  }

  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(currentLocation.latitude, currentLocation.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers["Current Location"] = marker;
    });
  }

  /*getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
        _currentPosition.latitude,
        _currentPosition.longitude,
      );
      Placemark place = p[0];

      setState(() {
        _currentAddress = '${place.locality}, ${place.postalCode}, ${place.country}';
      });
    } catch (e) {
      print (e);
    }
  }*/

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

}
