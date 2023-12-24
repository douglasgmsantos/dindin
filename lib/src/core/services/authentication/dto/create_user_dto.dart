class CreateUserDTO {
  final String name;
  final String password;
  final String email;

  CreateUserDTO({
    required this.name,
    required this.password,
    required this.email,
  });

  factory CreateUserDTO.fromJson(Map<String, dynamic> json) {
    return CreateUserDTO(
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
