import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets margin;
  static const EdgeInsets temp = EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 15,
  );

  CustomCard({@required this.child, this.color, this.margin = temp});

  @override
  Widget build(BuildContext context) => Card(
    margin: margin,
    child: Padding(
      padding: EdgeInsets.all(20),
      child: child,
    ),
    color: color,
  );
}

class CustomCardTitle extends StatelessWidget {
  final String title;
  final double bottom;

  CustomCardTitle({@required this.title, this.bottom: 15});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          textScaleFactor: 1.5,
        )
      ],
    ),
  );
}