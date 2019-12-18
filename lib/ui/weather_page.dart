import 'dart:async';

import '../blocs/weather_bloc.dart';
import '../blocs/weather_event.dart';
import '../blocs/weather_state.dart';
import '../ui/widget/combined_weather_temperature.dart';
import '../ui/widget/last_update.dart';
import '../ui/widget/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './search_page.dart';
import '../model/weather.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  WeatherPage({this.weather});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Completer<void> refresher;
  @override
  void initState() {
    super.initState();
    refresher = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade200,
      appBar: AppBar(
        title: Text('Flutter Weather'),
        //centerTitle: true,
        actions: <Widget>[
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.search),
            onPressed: () async {
              final city = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SelectionPage()));
              if (city != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(FetchWeather(city: city));
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is EmptyState) {
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                Text('Select any city to get information',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                Text(' about its weather',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)
              ],
            ));
          }
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return Center(
              child: Text('error'),
            );
          }
          if (state is LoadedState)
            return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                    RefreshWeather(city: state.weather.location),
                  );
                  return refresher.future;
                },
                child: ListView(
                  
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Location(
                        location: state.weather.location,
                      ),
                    ),
                    Center(
                      child: LastUpdate(
                        lastUpdate: state.weather.lastUpdate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombinedWeather(
                          weather: state.weather,
                        ),
                      ),
                    ),
                  ],
                ));
        },
      ),
    );
  }
}
