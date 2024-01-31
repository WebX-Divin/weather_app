import 'dart:ui';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: const Icon(Icons.refresh, size: 30),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //main card
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20,
                      sigmaY: 20,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
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
            const SizedBox(height: 15),
            //secondary card
            const Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              children: [
                SizedBox(
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                          '21:00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 8),
                        Icon(Icons.cloud),
                        SizedBox(height: 8),
                        Text(
                          'Cloudy',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Placeholder(
              fallbackHeight: 150,
            ),
            const SizedBox(height: 25),
            //third card
            const Placeholder(
              fallbackHeight: 150,
            ),
          ],
        ),
      ),
    );
  }
}
