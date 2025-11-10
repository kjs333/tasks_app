// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherModel {

@JsonKey(fromJson: _convertToDateTime) DateTime get time; num get interval;@JsonKey(name: 'temperature_2m') num get temperature;@JsonKey(name: 'is_day') num get isDay;@JsonKey(name: 'wind_speed_10m') num get windSpeed;@JsonKey(name: 'weather_code', fromJson: _convertWeatherCode) String get weatherDescription;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);

  /// Serializes this WeatherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.time, time) || other.time == time)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,interval,temperature,isDay,windSpeed,weatherDescription);

@override
String toString() {
  return 'WeatherModel(time: $time, interval: $interval, temperature: $temperature, isDay: $isDay, windSpeed: $windSpeed, weatherDescription: $weatherDescription)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _convertToDateTime) DateTime time, num interval,@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'is_day') num isDay,@JsonKey(name: 'wind_speed_10m') num windSpeed,@JsonKey(name: 'weather_code', fromJson: _convertWeatherCode) String weatherDescription
});




}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? interval = null,Object? temperature = null,Object? isDay = null,Object? windSpeed = null,Object? weatherDescription = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as num,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _convertToDateTime)  DateTime time,  num interval, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'is_day')  num isDay, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: _convertWeatherCode)  String weatherDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.time,_that.interval,_that.temperature,_that.isDay,_that.windSpeed,_that.weatherDescription);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _convertToDateTime)  DateTime time,  num interval, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'is_day')  num isDay, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: _convertWeatherCode)  String weatherDescription)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.time,_that.interval,_that.temperature,_that.isDay,_that.windSpeed,_that.weatherDescription);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _convertToDateTime)  DateTime time,  num interval, @JsonKey(name: 'temperature_2m')  num temperature, @JsonKey(name: 'is_day')  num isDay, @JsonKey(name: 'wind_speed_10m')  num windSpeed, @JsonKey(name: 'weather_code', fromJson: _convertWeatherCode)  String weatherDescription)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.time,_that.interval,_that.temperature,_that.isDay,_that.windSpeed,_that.weatherDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeatherModel implements WeatherModel {
  const _WeatherModel({@JsonKey(fromJson: _convertToDateTime) required this.time, required this.interval, @JsonKey(name: 'temperature_2m') required this.temperature, @JsonKey(name: 'is_day') required this.isDay, @JsonKey(name: 'wind_speed_10m') required this.windSpeed, @JsonKey(name: 'weather_code', fromJson: _convertWeatherCode) required this.weatherDescription});
  factory _WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

@override@JsonKey(fromJson: _convertToDateTime) final  DateTime time;
@override final  num interval;
@override@JsonKey(name: 'temperature_2m') final  num temperature;
@override@JsonKey(name: 'is_day') final  num isDay;
@override@JsonKey(name: 'wind_speed_10m') final  num windSpeed;
@override@JsonKey(name: 'weather_code', fromJson: _convertWeatherCode) final  String weatherDescription;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.time, time) || other.time == time)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.isDay, isDay) || other.isDay == isDay)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.weatherDescription, weatherDescription) || other.weatherDescription == weatherDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,interval,temperature,isDay,windSpeed,weatherDescription);

@override
String toString() {
  return 'WeatherModel(time: $time, interval: $interval, temperature: $temperature, isDay: $isDay, windSpeed: $windSpeed, weatherDescription: $weatherDescription)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _convertToDateTime) DateTime time, num interval,@JsonKey(name: 'temperature_2m') num temperature,@JsonKey(name: 'is_day') num isDay,@JsonKey(name: 'wind_speed_10m') num windSpeed,@JsonKey(name: 'weather_code', fromJson: _convertWeatherCode) String weatherDescription
});




}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? interval = null,Object? temperature = null,Object? isDay = null,Object? windSpeed = null,Object? weatherDescription = null,}) {
  return _then(_WeatherModel(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as num,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as num,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as num,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as num,weatherDescription: null == weatherDescription ? _self.weatherDescription : weatherDescription // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
