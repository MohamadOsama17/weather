import './blocs/weather_bloc.dart';
import './repository/weather_api_client.dart';
import './repository/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import './ui/weather_page.dart';


void main(){
  final WeatherRepository weatherRepository=WeatherRepository(
    clientWeatherApi: ClientWeatherApi(
      httpClient: http.Client()
    )
  );
  runApp(MyApp(weatherRepository: weatherRepository,));}


class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  MyApp({@required this.weatherRepository}):assert(weatherRepository !=null);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context)=>WeatherBloc(
          weatherRepository: weatherRepository
        ),
        child: WeatherPage(),
      ),
    );
  }
}