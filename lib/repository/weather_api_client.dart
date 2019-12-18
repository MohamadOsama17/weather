import '../model/weather.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ClientWeatherApi{

  final http.Client httpClient;
  ClientWeatherApi({@required this.httpClient}) :
  assert(httpClient != null);

  static const baseUrl ='https://www.metaweather.com'; 

  Future <int> fetchLocationId(String mycity) async{
    //final locationUrl = '$baseUrl/api/location/search/?query=$city';
    var locationUrl ='$baseUrl/api/location/search/?query=$mycity';
    //print(locationUrl);
    final response = await this.httpClient.get(locationUrl);
    if(response.statusCode != 200){
      throw Exception('Error in get Id by cityName');
    }
    final result = jsonDecode(response.body) as List;
    //print(result);
    return (result.first)['woeid'];
  }

  Future <Weather> fetchWeather(int mylocationId) async{
    final weatherUrl = '$baseUrl/api/location/$mylocationId';
    final response = await this.httpClient.get(weatherUrl);
    if(response.statusCode != 200){
      throw Exception('error in get weather by Id');
    }
    final result =jsonDecode(response.body);
    //print(result);
    return Weather.fromJson(result);
    
  }
}