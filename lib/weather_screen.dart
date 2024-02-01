import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additionalinfoItem.dart';
import 'package:weather_app/hourly_forecase.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: const Icon(Icons.refresh, 
            size: 30
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 9,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.6,
                      sigmaY: 2.6,
                      tileMode: TileMode.clamp,
                    ),
                    child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          '32°C',
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            //secondary card
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(time: '02:00', icon: Icons.cloud, temperature: '28°C'),
                  HourlyForecast(time: '04:00', icon: Icons.cloud, temperature: '30°C'),
                  HourlyForecast(time: '06:00', icon: Icons.cloud, temperature: '27°C'),
                  HourlyForecast(time: '08:00', icon: Icons.cloud, temperature: '29°C'),
                  HourlyForecast(time: '10:00', icon: Icons.cloud, temperature: '31°C'),
                ],
              ),
            ),
            const SizedBox(height: 25),

            //third card
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information', 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                additionalInfoItem(tempData: '87', icon: Icons.water_drop, temperature: 'Humidity',),
                additionalInfoItem(tempData: '7.66', icon: Icons.air, temperature: 'Wind Speed',),
                additionalInfoItem(tempData: '1007', icon: Icons.beach_access, temperature: 'Pressure',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

