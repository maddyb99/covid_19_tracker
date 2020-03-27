//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:covid19tracker/common/ui/shimmer_animation/shimmer_animation.dart';
import 'package:covid19tracker/splash/custom_background.dart';
import 'package:permission_handler/permission_handler.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isSignIn;
//  SizeConfig sizeConfig = SizeConfig();
  Future<void> getPermissions() async {
//    List<PermissionName> permissionnames = [PermissionName.Storage];
    print("request");
//    List<Permissions> permission=await Permission.getPermissionsStatus(permissionnames);
//    print(permission[0].permissionStatus);
//    Permission.requestPermissions(permissionnames);
    List<PermissionGroup> permission = [
//      PermissionGroup.camera,
//      PermissionGroup.microphone,
      PermissionGroup.locationAlways,
//      PermissionGroup.mediaLibrary,
    ];
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions(permission);
    permissions.forEach((PermissionGroup pg, PermissionStatus ps) {
      print(pg.toString() + " " + ps.toString() + "\n");
    });
  }

  @override
  void initState() {
    super.initState();
    getPermissions();
    Future.delayed(Duration(seconds: 2)).then((v) {
          Navigator.of(context).pushReplacementNamed('/dash');
        });
//    Authenticate().isSignIn().then((isSignIn) {
//      if (isSignIn)
//        Authenticate().nextPage(context);
//      else
//        Future.delayed(Duration(seconds: 2)).then((v) {
//          Navigator.of(context).pushReplacementNamed('/auth');
//        });
//    });
  }

  @override
  Widget build(BuildContext context) {
//    sizeConfig.init(context);
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            painter: CustomBackground(context: context),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  height: 60,
                  width: 60,
                  child: Hero(
                    tag: 'logo',
                    child:
                        Icon(Icons.photo_camera),
                  ),
                ),
              ),
            ),
          ),
          Shimmer(),
        ],
      ),
    );
  }
}
