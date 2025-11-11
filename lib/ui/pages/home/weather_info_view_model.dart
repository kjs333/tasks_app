import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/core/geolocator_helper.dart';
import 'package:tasks_app/data/model/weather_model.dart';
import 'package:tasks_app/data/repository/weather_repository.dart';

part 'weather_info_view_model.g.dart';

@riverpod
class WeatherInfoViewModel extends _$WeatherInfoViewModel {
  @override
  Future<WeatherModel?> build() async {
    return await getWeather();
  }

  Future<WeatherModel?> getWeather() async {
    try {
      final position = await GeolocatorHelper.getPositon();
      if (position != null) {
        final weatherRepo = WeatherRepository();
        final response = await weatherRepo.getWeather(
          latitude: position.latitude,
          longitude: position.longitude,
        );
        return response;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> refreshWeather() async {
    state = AsyncLoading();
    final response = await getWeather();
    state = AsyncData(response);
  }
}
