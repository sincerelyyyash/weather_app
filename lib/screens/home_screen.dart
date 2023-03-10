import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/hourly_data_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  //call
  final globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
            Colors.black,
            Color(0xFF121212),
            Color(0xFF262626),
            Color(0xFF333333),
            Colors.grey
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              //type of value
              child: Obx((() => globalController.checkLoading().isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const HeaderWidget(),
                        //for our current temp ('current')
                        CurrentWeatherWidget(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // HourlyDataWidget(
                        //   weatherDataHourly:
                        //       globalController.getData().getHourlyWeather(),
                        // )
                      ],
                    )))))),
    );
  }
}
