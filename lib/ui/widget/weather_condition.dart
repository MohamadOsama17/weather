import 'package:flutter/material.dart';
import 'package:advanced_weather_using_bloc/model/weather.dart';


class WeatherConditions extends StatelessWidget {

  final WeatherCondition condition;

  WeatherConditions({@required this.condition}):assert(condition!=null);

  @override
  Widget build(BuildContext context) =>
     _mapConditionToImage(condition);
  
  Image _mapConditionToImage(WeatherCondition condition){
    Image image;
    switch(condition){
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
      image = Image.asset('assets/images/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
      image = Image.asset('assets/images/snow.png');
        break;
      case WeatherCondition.heavyCloud:
      image = Image.asset('assets/images/cloud.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
      image = Image.asset('assets/images/rainy.png');
        break;
      case WeatherCondition.thunderStorm:
      image=Image.asset('assets/images/storm.png');
        break;
      case WeatherCondition.unknown:
      image=Image.asset('assets/images/clear.png');
        break;
    }
    return image;
  }
}