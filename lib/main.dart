import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;

    case "Partly cloudy":
      return Colors.lightBlue;

    case "Cloudy":
    case "Overcast":
      return Colors.grey;

    case "Mist":
    case "Fog":
    case "Freezing fog":
      return Colors.blueGrey;

    case "Patchy rain possible":
    case "Light drizzle":
    case "Patchy light drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Light rain shower":
      return Colors.lightBlue;

    case "Moderate rain":
    case "Moderate rain at times":
    case "Moderate or heavy rain shower":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.blue;

    case "Heavy rain":
    case "Heavy rain at times":
    case "Torrential rain shower":
      return Colors.indigo;

    case "Thundery outbreaks possible":
      return Colors.purple;

    case "Patchy snow possible":
    case "Patchy light snow":
    case "Light snow":
    case "Light snow showers":
      return Colors.lightBlue;

    case "Moderate snow":
    case "Patchy moderate snow":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy snow with thunder":
      return Colors.blue;

    case "Blizzard":
    case "Heavy snow":
      return Colors.grey;

    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan;

    case "Light sleet":
    case "Light sleet showers":
      return Colors.cyan;

    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
      return Colors.teal;

    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;

    default:
      return Colors.blueGrey;
  }
}
