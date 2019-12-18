
import 'package:meta/meta.dart';

abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent{
  final String city;
  FetchWeather({@required this.city}):assert(city!=null);
  
}

class RefreshWeather extends WeatherEvent{
  final String city;
  RefreshWeather({@required this.city});
}