import 'package:flutter/foundation.dart';

enum Priority { high, medium, low }

class Task {
  final String id;
  final String title;
  final String description;
  final Priority priority;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
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
