// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState {

 List<ToDoEntity> get todoList; bool get sortWithDate; bool get sortWithDone;
/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageStateCopyWith<HomePageState> get copyWith => _$HomePageStateCopyWithImpl<HomePageState>(this as HomePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState&&const DeepCollectionEquality().equals(other.todoList, todoList)&&(identical(other.sortWithDate, sortWithDate) || other.sortWithDate == sortWithDate)&&(identical(other.sortWithDone, sortWithDone) || other.sortWithDone == sortWithDone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(todoList),sortWithDate,sortWithDone);

@override
String toString() {
  return 'HomePageState(todoList: $todoList, sortWithDate: $sortWithDate, sortWithDone: $sortWithDone)';
}


}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res>  {
  factory $HomePageStateCopyWith(HomePageState value, $Res Function(HomePageState) _then) = _$HomePageStateCopyWithImpl;
@useResult
$Res call({
 List<ToDoEntity> todoList, bool sortWithDate, bool sortWithDone
});




}
/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todoList = null,Object? sortWithDate = null,Object? sortWithDone = null,}) {
  return _then(_self.copyWith(
todoList: null == todoList ? _self.todoList : todoList // ignore: cast_nullable_to_non_nullable
as List<ToDoEntity>,sortWithDate: null == sortWithDate ? _self.sortWithDate : sortWithDate // ignore: cast_nullable_to_non_nullable
as bool,sortWithDone: null == sortWithDone ? _self.sortWithDone : sortWithDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomePageState].
extension HomePageStatePatterns on HomePageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePageState value)  $default,){
final _that = this;
switch (_that) {
case _HomePageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePageState value)?  $default,){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ToDoEntity> todoList,  bool sortWithDate,  bool sortWithDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.todoList,_that.sortWithDate,_that.sortWithDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ToDoEntity> todoList,  bool sortWithDate,  bool sortWithDone)  $default,) {final _that = this;
switch (_that) {
case _HomePageState():
return $default(_that.todoList,_that.sortWithDate,_that.sortWithDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ToDoEntity> todoList,  bool sortWithDate,  bool sortWithDone)?  $default,) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.todoList,_that.sortWithDate,_that.sortWithDone);case _:
  return null;

}
}

}

/// @nodoc


class _HomePageState implements HomePageState {
  const _HomePageState({required final  List<ToDoEntity> todoList, required this.sortWithDate, required this.sortWithDone}): _todoList = todoList;
  

 final  List<ToDoEntity> _todoList;
@override List<ToDoEntity> get todoList {
  if (_todoList is EqualUnmodifiableListView) return _todoList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todoList);
}

@override final  bool sortWithDate;
@override final  bool sortWithDone;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageStateCopyWith<_HomePageState> get copyWith => __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageState&&const DeepCollectionEquality().equals(other._todoList, _todoList)&&(identical(other.sortWithDate, sortWithDate) || other.sortWithDate == sortWithDate)&&(identical(other.sortWithDone, sortWithDone) || other.sortWithDone == sortWithDone));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todoList),sortWithDate,sortWithDone);

@override
String toString() {
  return 'HomePageState(todoList: $todoList, sortWithDate: $sortWithDate, sortWithDone: $sortWithDone)';
}


}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(_HomePageState value, $Res Function(_HomePageState) _then) = __$HomePageStateCopyWithImpl;
@override @useResult
$Res call({
 List<ToDoEntity> todoList, bool sortWithDate, bool sortWithDone
});




}
/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todoList = null,Object? sortWithDate = null,Object? sortWithDone = null,}) {
  return _then(_HomePageState(
todoList: null == todoList ? _self._todoList : todoList // ignore: cast_nullable_to_non_nullable
as List<ToDoEntity>,sortWithDate: null == sortWithDate ? _self.sortWithDate : sortWithDate // ignore: cast_nullable_to_non_nullable
as bool,sortWithDone: null == sortWithDone ? _self.sortWithDone : sortWithDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
