class Task {
  String content;
  bool isFinished;

  Task({required this.content, this.isFinished = false});

  Task.fromMap(Map<String, dynamic> data)
      : content = data['content'],
        isFinished = data['isFinished'] == 1 ? true : false;

  Map<String, dynamic> toMap() {
    return ({'content': content, 'isFinished': isFinished});
  }
}
