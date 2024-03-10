import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import './hourlyforecasr.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Future getcurrentweather() async {
    try {
      final current_temp = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=Faisalabad,pk&APPID=ed572b4268c8419b32c60b6a92f7b242'));

      final data = jsonDecode(current_temp.body);
      if (data['cod'] != 200) {
        throw 'An unexpected error occured';
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                getcurrentweather();
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: getcurrentweather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data;
          final currentTemp = data['main']['temp'];
          final cloudy = data['weather'][0]['main'];
          final humid = data['main']['humidity'];
          final winds = data['wind']['speed'];
          final pressurep = data['main']['pressure'];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 32),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Icon(
                                cloudy == 'Clouds' ||
                                        cloudy == 'Rain' ||
                                        cloudy == 'Smoke'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                cloudy,
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Weather Forecast",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(height: 8),
                const SizedBox(
                  height: 120,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                        HourlyForecast(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Additional Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 8,
                ),
                AdditionalInfo(
                  humidity: humid,
                  wind: winds,
                  pressure: pressurep,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
