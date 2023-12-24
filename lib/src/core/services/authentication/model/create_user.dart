class CreateUser {
  final String name;
  final String password;
  final String email;

  CreateUser({
    required this.name,
    required this.password,
    required this.email,
  });

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      name: json['name'],
      password: json['password'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
    };
  }
}
