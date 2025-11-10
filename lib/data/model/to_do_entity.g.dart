// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoEntity _$ToDoEntityFromJson(Map<String, dynamic> json) => _ToDoEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  isFavorite: json['is_favorite'] as bool,
  isDone: json['is_done'] as bool,
);

Map<String, dynamic> _$ToDoEntityToJson(_ToDoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'is_favorite': instance.isFavorite,
      'is_done': instance.isDone,
    };
