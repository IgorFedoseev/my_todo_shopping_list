// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskId: json['taskId'] as String,
      text: json['text'] as String,
      urgency: json['urgency'] as String,
      isDone: Task._boolFromInt(json['isDone'] as int),
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'text': instance.text,
      'urgency': instance.urgency,
      'isDone': Task._boolToInt(instance.isDone),
    };
