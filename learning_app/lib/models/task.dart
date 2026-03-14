enum TaskStatus {
  pending,
  completed,
}

class Task {
  final String id;
  final String title;
  final String? description;
  final DateTime deadline;
  final TaskStatus status;
  final String subjectId;

  const Task({
    required this.id,
    required this.title,
    this.description,
    required this.deadline,
    required this.status,
    required this.subjectId,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    TaskStatus? status,
    String? subjectId,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
      subjectId: subjectId ?? this.subjectId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'status': status.name,
      'subjectId': subjectId,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      deadline: DateTime.parse(json['deadline'] as String),
      status: TaskStatus.values.byName(json['status'] as String),
      subjectId: json['subjectId'] as String,
    );
  }
}
