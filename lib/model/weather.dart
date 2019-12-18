
enum WeatherCondition{
  snow,
  sleet,
  hail,
  thunderStorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}


class Weather{
  final String location;
  final int locationID;
  final String formatedState;
  final WeatherCondition weatherState;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final DateTime lastUpdate;

  Weather({
    this.temp,this.maxTemp,this.lastUpdate,this.created,this.formatedState,
    this.location,this.locationID,this.minTemp,this.weatherState
  });

  static Weather fromJson(dynamic json){
    final consulted = json['consolidated_weather'][0];
    return Weather(
      
      created: consulted['created'],
      formatedState: consulted['weather_state_name'],
      lastUpdate: DateTime.now(),
      location: json['title'],
      locationID: json['woeid'] as int,
      maxTemp: consulted['max_temp'] as double,
      minTemp: consulted['min_temp'] as double,
      temp: consulted['the_temp'] as double,
      weatherState: _mapStringToWeatherState(consulted['weather_state_abbr']),
    );
  }
  static Weather weatherFromJson( List<dynamic> json){
    return Weather();
  }

   static _mapStringToWeatherState(String input){
     WeatherCondition state;
     switch(input){
       case 'sn' : state=WeatherCondition.snow;
       break ;
       case 'sl' : state=WeatherCondition.sleet;
       break ;
       case 'h' : state =WeatherCondition.hail;
       break ;
       case 't' : state =WeatherCondition.thunderStorm;
       break ;
       case 'hr' : state=WeatherCondition.heavyRain;
       break ;
       case 'lr' : state =WeatherCondition.lightRain;
       break ;
       case 's' : state =WeatherCondition.showers;
       break ;
       case 'hc' : state =WeatherCondition.heavyCloud;
       break ;
       case 'lc' : state =WeatherCondition.lightCloud;
       break ;
       case 'c' : state =WeatherCondition.clear;
       break ;
       default : state=WeatherCondition.unknown;
     }
    return state;
   }
}

class WeatherFew{
  final String title;
  final int locationId;

  WeatherFew({this.locationId,this.title});
}