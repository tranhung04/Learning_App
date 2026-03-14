class Subject {
  final String id;
  final String name;
  final String? description;
  final String userId;

  const Subject({
    required this.id,
    required this.name,
    this.description,
    required this.userId,
  });

  Subject copyWith({
    String? id,
    String? name,
    String? description,
    String? userId,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'userId': userId,
    };
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      userId: json['userId'] as String,
    );
  }
}
