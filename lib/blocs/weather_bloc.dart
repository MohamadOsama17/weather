//import '../model/weather.dart';
import '../blocs/weather_state.dart';

import '../repository/weather_repository.dart';
import 'package:meta/meta.dart';
import '../model/weather.dart';
import './weather_event.dart';
import 'package:bloc/bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  
  final WeatherRepository weatherRepository;
  WeatherBloc({@required this.weatherRepository}):assert(weatherRepository!=null);

  @override
  WeatherState get initialState => EmptyState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if(event is FetchWeather){
      yield LoadingState();
      try{
      final Weather weather = await weatherRepository.getWeather(event.city);
      yield LoadedState(weather: weather);
      }catch(_){
        yield ErrorState();
      }
    }if (event is RefreshWeather){
      try{
        final weather = await weatherRepository.getWeather(event.city);
        yield LoadedState(weather: weather);
      }
      catch (_){
        yield state;
      }
    }
  }
}