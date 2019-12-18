import '../model/weather.dart';
import './weather_api_client.dart';
import 'package:meta/meta.dart';
import 'dart:async';


class WeatherRepository{

  final ClientWeatherApi clientWeatherApi;
  WeatherRepository({@required this.clientWeatherApi}) : 
  assert (clientWeatherApi !=null);

  Future<Weather> getWeather(String city) async{

    final int locationId = await clientWeatherApi.fetchLocationId(city);
    Weather weather =await clientWeatherApi.fetchWeather(locationId);
    print(weather);
    return weather;

  }

}