import 'package:covid19tracker/common/ui/custom_card.dart';
import 'package:covid19tracker/dashboard/model/stats.dart';
import 'package:covid19tracker/dashboard/resource/getStats.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Location location;
  LocationData locationData;
  CurrStats currStats;

  @override
  initState() {
    super.initState();
    listenForCurrStats();
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
 Future<void> listenForCurrStats() async {
    final Stream<CurrStats> stream = await getCurrStats();
    stream.listen((CurrStats beer) =>
        setState(() =>  currStats=beer)
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Tracker'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),onPressed: listenForCurrStats,)
        ],
      ),
      body: RefreshIndicator(
        onRefresh: listenForCurrStats,
        child: Column(
          children: <Widget>[
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('upload'),
              ),
            ),
            CustomCard(
              child: Column(
                children: <Widget>[
                  CustomCardTitle(title: 'Total'),
                  Text(currStats.total.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Indian'),
                          Text(currStats.confirmedIndian.toString()),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Foreign'),
                          Text(currStats.confirmedForeign.toString()),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ),
            CustomCard(
              child: Column(
                children: <Widget>[
                  CustomCardTitle(title: 'Discharged'),
                  Text(currStats.discharged.toString())
                ],
              )
            ),
            CustomCard(
              child: Column(
                children: <Widget>[
                  CustomCardTitle(title: 'Deaths'),
                  Text(currStats.deaths.toString())
                ],
              )
            ),
            locationData != null ? Text(locationData.toString()) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
