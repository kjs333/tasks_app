// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomePageViewModel)
const homePageViewModelProvider = HomePageViewModelProvider._();

final class HomePageViewModelProvider
    extends $AsyncNotifierProvider<HomePageViewModel, HomePageState?> {
  const HomePageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePageViewModelHash();

  @$internal
  @override
  HomePageViewModel create() => HomePageViewModel();
}

String _$homePageViewModelHash() => r'8ec48404be747479e32560d10dc20f8b555060b4';

abstract class _$HomePageViewModel extends $AsyncNotifier<HomePageState?> {
  FutureOr<HomePageState?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<HomePageState?>, HomePageState?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomePageState?>, HomePageState?>,
              AsyncValue<HomePageState?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
