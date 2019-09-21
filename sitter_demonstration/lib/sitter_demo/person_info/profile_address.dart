import 'package:flutter/material.dart';
//import 'package:geocoder/geocoder.dart';

//geolocator, location pub

class ProfileAddress extends StatelessWidget {
  final String address;

  ProfileAddress(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        address,
        style: TextStyle(color: Colors.white,
                        fontSize: 15.0,),
      ),
    );
  }
}

/*getUserLocation() async {//call this async method from whereever you need

      Map<String, double> currentLocation = new Map();
      Map<String, double> myLocation;
      String error;
      Location location = new Location();
      try {
        myLocation = await location.getLocation();
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          error = 'please grant permission';
          print(error);
        }
        if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
          error = 'permission denied- please enable it from app settings';
          print(error);
        }
        myLocation = null;
      }
      currentLocation = myLocation;
      final coordinates = new Coordinates(
          currentLocation['latitude'], currentLocation['longitude']);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(
          coordinates);
      var first = addresses.first;
      print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
      return first;
    }
*/