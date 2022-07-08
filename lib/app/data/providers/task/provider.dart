import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_to_do_app/app/core/utils/keys.dart';
import 'package:getx_to_do_app/app/data/models/task.dart';
import 'package:getx_to_do_app/app/data/services/storage/services.dart';

class TaskProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((task) {
      tasks.add(Task.fromJson(task));
    });
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
