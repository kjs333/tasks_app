import 'package:flutter/material.dart';
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
                  alignment: Alignment.topCenter,
                  width: 50,
                  height: 50,
                  child: Icon(Icons.refresh),
                ),
              ),
              Expanded(
                child: data == null
                    ? Container(
                        alignment: Alignment.topCenter,
                        width: 50,
                        height: 50,
                        child: Text("잠시 후 다시 새로고침해주세요."),
                      )
                    : Padding(
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
                                    "업데이트 시간 : ${data.time.year % 100}년 ${data.time.month}월 ${data.time.day}일 ${data.time.hour}시 ${data.time.minute}분",
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
