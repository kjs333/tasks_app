import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/ui/pages/home/weather_info_view_model.dart';

class HomePageBtmNavigation extends ConsumerWidget {
  const HomePageBtmNavigation({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherInfoViewModelProvider);
    return state.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: false,
      error: (e, _) => Text("에러: $e"),
      loading: () => Container(
        width: double.infinity,
        height: 100,
        color: vrc(context).generalBack,
        child: Center(child: CircularProgressIndicator()),
      ),
      data: (data) {
        if (data == null) {
          return Container(
            width: double.infinity,
            height: 100,
            color: vrc(context).generalBack,
          );
        }
        final year = data.time.year % 100;
        return Container(
          width: double.infinity,
          height: 100,
          color: vrc(context).generalBack,
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  await ref
                      .read(weatherInfoViewModelProvider.notifier)
                      .refreshWeather();
                },
                child: Container(
                  width: 50,
                  height: 100,
                  child: Icon(Icons.refresh),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.end,
                              "업데이트 시간 : $year년 ${data.time.month}월 ${data.time.day}일 ${data.time.hour}시 ${data.time.minute}분",
                            ),
                          ),
                          SizedBox(width: 10),
                          (data.time.hour >= 6 && data.time.hour <= 18)
                              ? Icon(Icons.sunny)
                              : Icon(Icons.nightlight_round),
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.end,
                        '날씨:${data.weatherDescription} 온도:${data.temperature}°C  풍속:${data.windSpeed}m/s',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
