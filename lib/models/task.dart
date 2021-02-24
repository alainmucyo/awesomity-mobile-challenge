import 'package:flutter/foundation.dart';

enum Priority { high, medium, low }

class Task {
  String id;
  String title;
  String description;
  Priority priority;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  bool done;

  Task({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.priority,
    this.done = false,
  });
}
