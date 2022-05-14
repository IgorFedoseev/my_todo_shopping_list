import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

enum Urgency { high, medium, low }

extension UrgencyAsString on Urgency {
  String asString() {
    switch (this) {
      case Urgency.high:
        return 'высокий';
      case Urgency.medium:
        return 'средний';
      case Urgency.low:
        return 'низкий';
    }
  }
}

@JsonSerializable()
class Task {
  final String taskId;
  final String text;
  final String urgency;
  @JsonKey(fromJson: _boolFromInt, toJson: _boolToInt)
  final bool isDone;

  static bool _boolFromInt(int isDone) => isDone == 1;
  static int _boolToInt(bool isDone) => isDone ? 1 : 0;

  Task({
    required this.taskId,
    required this.text,
    required this.urgency,
    required this.isDone,
  });

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith({
    String? taskId,
    String? text,
    String? urgency,
    bool? isDone,
  }) {
    return Task(
      taskId: taskId ?? this.taskId,
      text: text ?? this.text,
      urgency: urgency ?? this.urgency,
      isDone: isDone ?? this.isDone,
    );
  }
}
