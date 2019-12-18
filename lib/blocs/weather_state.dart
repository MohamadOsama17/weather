import 'package:meta/meta.dart';

import '../model/weather.dart';


abstract class WeatherState{}

class EmptyState extends WeatherState{}

class LoadingState extends WeatherState{}

class LoadedState extends WeatherState{
  final Weather weather ;
  LoadedState({@required this.weather}):assert(weather !=null);
}

class ErrorState extends WeatherState{}