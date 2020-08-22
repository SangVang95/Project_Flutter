 import 'package:flutter/material.dart';
import 'package:flutterbloc/model/weather.dart';

class CombinedWeatherTemperature extends StatelessWidget {

  final Weather weather;

  const CombinedWeatherTemperature({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child:Text('Condition: ${_convertCondition(weather.condition)}'),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text('Temperature: ${_toInt(weather.temp)}') ,
                      )
                    ],),
                    Column(
                      children: <Widget>[
                        Text('TempMax: ${_toInt(weather.maxTemp)}'),
                        SizedBox(height: 10,),
                        Text('TempMin: ${_toInt(weather.minTemp)}')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  int _toInt(double temp) => temp.round();

  String _convertCondition(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.snow:
        return 'Snow';
        break;
      case WeatherCondition.sleet:
        return 'Sleet';
        break;
      case WeatherCondition.hail:
        return 'Hail';
        break;
      case WeatherCondition.thunderstorm:
        return 'ThunderStorm';
        break;
      case WeatherCondition.heavyRain:
        return 'HeavyRain';
        break;
      case WeatherCondition.lightRain:
        return 'Lightrain';
        break;
      case WeatherCondition.showers:
        return 'Showers';
        break;
      case WeatherCondition.heavyCloud:
        return 'Heavycloud';
        break;
      case WeatherCondition.lightCloud:
        return 'Lightcloud';
        break;
      case WeatherCondition.clear:
        return 'Clear';
        break;
      case WeatherCondition.unknown:
        return 'Not define';
        break;
    }
  }

}