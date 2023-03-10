// ignore_for_file: avoid_unnecessary_containers, dead_code

import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/model/weather/weather_data_current.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/painting.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //temperature area
      temperatureAreaWidget(),
      const SizedBox(
        height: 0,
      ),
      Column(
        children: [
          tempDataDesc(),
          const SizedBox(
            height: 5,
          )
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            weatherDataIcons(),
            const SizedBox(
              height: 30,
            ),
            weatherDataValue(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        currentTempData(),
        const SizedBox(
          height: 40,
          width: 40,
        )
      ]),
    ]);
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 150,
          width: 150,
        )
      ],
    );
  }

  Widget weatherDataIcons() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(left: 20, top: 55, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffE9ECF1), borderRadius: BorderRadius.circular(15)),
        child: Image.asset("assets/icons/windspeed.png"),
      ),
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffE9ECF1), borderRadius: BorderRadius.circular(15)),
        child: Image.asset("assets/icons/clouds.png"),
      ),
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(left: 20, top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffE9ECF1), borderRadius: BorderRadius.circular(15)),
        child: Image.asset("assets/icons/humidity.png"),
      ),
    ]);
  }

  Widget weatherDataValue() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(left: 10, top: 60, bottom: 5),
            padding: const EdgeInsets.all(10),
            child: Text(
              "${weatherDataCurrent.current.windSpeed}km/h",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
        Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(left: 10, top: 40, bottom: 16),
            padding: const EdgeInsets.all(10),
            child: Text(
              "${weatherDataCurrent.current.clouds}%",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
        Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.only(left: 10, top: 25),
          padding: const EdgeInsets.all(10),
          child: Text(
            "${weatherDataCurrent.current.humidity}%",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  Widget currentTempData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 100,
            width: 150,
            margin: const EdgeInsets.only(left: 30, top: 210),
            child: Text("${weatherDataCurrent.current.temp!.toInt()}°C",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 68,
                  color: Colors.white,
                ))),
      ],
    );
  }

  Widget tempDataDesc() {
    return Container(
        child: Text("${weatherDataCurrent.current.weather![0].description}",
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 25,
              color: Colors.white,
            )));
  }
}
