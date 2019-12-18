import 'package:flutter/material.dart';


class TempWidget extends StatelessWidget {
  final double mintemp;
  final double maxtemp;
  final double temp;

  TempWidget({@required this.maxtemp, @required this.mintemp , @required this.temp});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child:  Text('$temp °', 
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),),
          ),
          Column(
            children: <Widget>[
              Text('Min : ${_formattedTemperature(mintemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                ),
              ),
              Text('Min : ${_formattedTemperature(maxtemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  int _formattedTemperature(double t) => t.round();
}