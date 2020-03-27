import 'package:flutter/material.dart';
import 'package:location/location.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Location location;
  LocationData locationData;

  @override
  initState() {
    super.initState();
//    location.onLocationChanged;
    location = Location();
    location.changeSettings(
      accuracy: LocationAccuracy.navigation,
      distanceFilter: 10,
      interval: Duration(minutes: 5).inMilliseconds,
    );
//    location.getLocation().then((loc) {
//      locationData = loc;
//      print(locationData.accuracy);
//    });
    location.onLocationChanged.listen((loc) {
      setState(() {
        locationData = loc;
      });
      print(locationData.accuracy);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
      ),
      body: Column(
        children: <Widget>[
          MaterialButton(
            color: Colors.redAccent,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text('upload'),
            ),
          ),
          locationData != null ? Text(locationData.toString()) : SizedBox(),
        ],
      ),
    );
  }
}
