class ClientModel {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final double height; // in cm
  final double weight; // in kg
  final int age;
  final String gender;
  final String activityLevel;
  final String goal;
  final String? dietType;
  final String? dietPlanComments;
  final DateTime createdAt;
  final DateTime? lastVisit;

  ClientModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.goal,
    this.dietType,
    this.dietPlanComments,
    required this.createdAt,
    this.lastVisit,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
      'activityLevel': activityLevel,
      'goal': goal,
      'dietType': dietType,
      'dietPlanComments': dietPlanComments,
      'createdAt': createdAt.toIso8601String(),
      'lastVisit': lastVisit?.toIso8601String(),
    };
  }

  // Create from JSON
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      age: json['age'] as int,
      gender: json['gender'] as String,
      activityLevel: json['activityLevel'] as String,
      goal: json['goal'] as String,
      dietType: json['dietType'] as String?,
      dietPlanComments: json['dietPlanComments'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastVisit: json['lastVisit'] != null
          ? DateTime.parse(json['lastVisit'] as String)
          : null,
    );
  }

  // Create a copy with updated fields
  ClientModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    double? height,
    double? weight,
    int? age,
    String? gender,
    String? activityLevel,
    String? goal,
    String? dietType,
    String? dietPlanComments,
    DateTime? createdAt,
    DateTime? lastVisit,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      activityLevel: activityLevel ?? this.activityLevel,
      goal: goal ?? this.goal,
      dietType: dietType ?? this.dietType,
      dietPlanComments: dietPlanComments ?? this.dietPlanComments,
      createdAt: createdAt ?? this.createdAt,
      lastVisit: lastVisit ?? this.lastVisit,
    );
  }
}

