import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additionalinfoItem.dart';
import 'package:weather_app/hourly_forecase.dart';
import 'package:weather_app/secret.dart';
import 'package:http/http.dart' as http;


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async{
    try{
      String cityName = 'Salem';
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,IN&APPID=$key',
        ),
      );

      final data = jsonDecode(res.body);

      if(data['cod'] != '200'){
        throw 'Unexpected error occurred';
      }

      return data;

    } catch(e){
      throw e.toString();
    }

  }

  @override
  void initState(){
    super.initState();
    weather = getCurrentWeather();
  }


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
          IconButton(
            onPressed: (){
              setState((){
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if(snapshot.hasError){
            return const Center(
              child: Text(snapshot.error.toString()),
            );
          }
          
        }
        child: Padding(
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
                    HourlyForecast(time: '02:00', icon: Icons.cloud, temperature: '25°C'),
                    HourlyForecast(time: '05:00', icon: Icons.sunny, temperature: '30°C'),
                    HourlyForecast(time: '08:00', icon: Icons.sunny, temperature: '28°C'),
                    HourlyForecast(time: '11:00', icon: Icons.cloud, temperature: '23°C'),
                    HourlyForecast(time: '01:00', icon: Icons.sunny, temperature: '27°C'),
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
                  additionalInfoItem(
                    tempData: '87', 
                    icon: Icons.water_drop, 
                    temperature: 'Humidity',
                    ),
                  additionalInfoItem(
                    tempData: '7.66', 
                    icon: Icons.air, 
                    temperature: 'Wind Speed',
                    ),
                  additionalInfoItem(
                    tempData: '1007', 
                    icon: Icons.beach_access, 
                    temperature: 'Pressure',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

