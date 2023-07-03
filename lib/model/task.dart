class Task {
  String description;
  bool complete;
  String date;
  Task({
    this.description = '',
    this.complete = false,
    this.date = '',
  });
  void updateTask({
    required String description,
    required bool complete,
    required String date,
  }) {
    this.description = description;
    this.complete = complete;
    this.date = date;
  }
}
