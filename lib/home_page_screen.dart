import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  //final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  //Position _currentPosition;
  //String _currentAddress;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
      ),
      body:
        //mainAxisAlignment: MainAxisAlignment.center,
          /*if (_currentPosition != null) Text(_currentAddress),
          FlatButton(
            child: Text('Get Location'),
            onPressed: () => _getCurrentLocation(),
          ),*/
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            )
          ),
      );
  }

  /*_getCurrentLocation() {

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng
      (
      );
    }).catchError((e){
      print(e);
    });
  }

  _getAddressFromLatLng() async {
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
