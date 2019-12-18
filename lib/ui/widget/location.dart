import 'package:flutter/material.dart';


class Location extends StatelessWidget {
  final String location;
  Location({@required this.location});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(location,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          //color: Colors.white
        ),
      ),
    );
  }
}