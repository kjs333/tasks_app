import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
abstract class ToDoEntity with _$ToDoEntity {
  const factory ToDoEntity({
    required String id,
    required String title,
    required String? description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'is_done') required bool isDone,
  }) = _ToDoEntity;

  factory ToDoEntity.fromJson(Map<String, Object?> json) =>
      _$ToDoEntityFromJson(json);
}
