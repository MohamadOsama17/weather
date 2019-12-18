import 'package:advanced_weather_using_bloc/model/weather.dart';
import 'temp.dart';
import 'package:flutter/material.dart';
import 'weather_condition.dart';



class CombinedWeather extends StatelessWidget {
  final Weather weather;
  CombinedWeather({@required this.weather});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditions(
                condition: weather.weatherState,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TempWidget(
                    maxtemp: weather.maxTemp,
                    mintemp: weather.minTemp,
                    temp: weather.temp,
                  ),
            )
          ],
        ),
        Center(
          child: Text(
            weather.formatedState,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}