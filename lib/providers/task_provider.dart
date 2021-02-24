import 'package:awesomity_challenge/models/task.dart';
import 'package:flutter/foundation.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _items = [
    Task(
      id: "sss",
      title: "Drink water",
      description: "I have to drink water",
      image: "https://riverchurch.fr/wp-content/uploads/2020/04/water.jpg",
      done: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      priority: Priority.high,
    ),
    Task(
      id: "ddd",
      title: "Eat some food",
      description: "I will eat some damn food",
      image: "https://riverchurch.fr/wp-content/uploads/2020/04/water.jpg",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      priority: Priority.medium,
    ),
    Task(
      id: "fff",
      title: "Eat some food",
      description: "I will eat some damn food",
      image: "https://riverchurch.fr/wp-content/uploads/2020/04/water.jpg",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      priority: Priority.low,
    ),
  ];

  List<Task> get items {
    return [..._items];
  }

  void addTask(Task task) {
    task.createdAt = DateTime.now();
    task.updatedAt = DateTime.now();
    _items.add(task);
    notifyListeners();
  }
}
