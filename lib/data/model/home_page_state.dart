import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';

part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    required List<ToDoEntity> todoList,
    required bool sortWithDate,
    required bool sortWithDone,
  }) = _HomePageState;
}
