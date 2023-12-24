class UserEntity {
  String? uid;
  String? name;
  String? email;
  String? password;
  bool? isActive;

  DateTime? createdAt;
  DateTime? updatedAt;

  UserEntity({
    this.uid,
    required this.name,
    required this.email,
    this.password,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  String getFirstName() {
    return name!.split(" ").first;
  }

  String getFirstNameAndLastName() {
    if (name == null) return "Profile";

    String firstName = name!.split(" ").first;
    String lastName = name!.split(" ").last;
    return "$firstName $lastName";
  }

  UserEntity.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
