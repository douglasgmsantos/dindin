class User {
  String uid;
  String name;
  String email;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  String getFirstName() {
    return name.split(" ").first;
  }

  String getFirstNameAndLastName() {
    String firstName = name.split(" ").first;
    String lastName = name.split(" ").last;
    return "$firstName $lastName";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
