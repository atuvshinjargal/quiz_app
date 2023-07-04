import './task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = []; //tasks[0], tasks[1],..
  int get completeCount => 
  tasks.where((element) => 
  element.complete).length;
  String get complenetnessMessage => 
  '$completeCount out of ${tasks.length} tasks';
}