class UserModel {
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  UserModel copyWith({
    String? email,
    String? password,
  }) =>
      UserModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
