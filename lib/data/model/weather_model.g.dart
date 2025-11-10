// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      time: _convertToDateTime(json['time'] as String),
      interval: json['interval'] as num,
      temperature: json['temperature_2m'] as num,
      isDay: json['is_day'] as num,
      windSpeed: json['wind_speed_10m'] as num,
      weatherDescription: _convertWeatherCode(json['weather_code'] as num),
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'interval': instance.interval,
      'temperature_2m': instance.temperature,
      'is_day': instance.isDay,
      'wind_speed_10m': instance.windSpeed,
      'weather_code': instance.weatherDescription,
    };
