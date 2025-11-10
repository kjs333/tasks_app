// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WeatherInfoViewModel)
const weatherInfoViewModelProvider = WeatherInfoViewModelProvider._();

final class WeatherInfoViewModelProvider
    extends $AsyncNotifierProvider<WeatherInfoViewModel, WeatherModel?> {
  const WeatherInfoViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherInfoViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherInfoViewModelHash();

  @$internal
  @override
  WeatherInfoViewModel create() => WeatherInfoViewModel();
}

String _$weatherInfoViewModelHash() =>
    r'513bce06d0f2632c29e4660b1e21ee28ea55552a';

abstract class _$WeatherInfoViewModel extends $AsyncNotifier<WeatherModel?> {
  FutureOr<WeatherModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<WeatherModel?>, WeatherModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WeatherModel?>, WeatherModel?>,
              AsyncValue<WeatherModel?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
