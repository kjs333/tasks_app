// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks_app/data/repository/weather_repository.dart';

import 'package:tasks_app/main.dart';
import 'package:tasks_app/ui/pages/home/weather_info_view_model.dart';

void main() {
  test("Location Test", () async {
    final weatherRepo = WeatherRepository();
    final result = await weatherRepo.getWeather(
      latitude: 37.550263,
      longitude: 126.9970831,
    );
    print(result?.weatherDescription);
  });
}
