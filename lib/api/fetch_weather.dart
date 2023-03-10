import 'dart:convert';

// import 'dart:html';
import 'package:weatherapp_starter_project/model/weather/weather_data_current.dart';
import 'package:weatherapp_starter_project/api/api_url.dart';
import 'package:weatherapp_starter_project/model/weather/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/model/weather/weather_data_hourly.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  //processing the data from response to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString));
    return weatherData!;
  }
}
