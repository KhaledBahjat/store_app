class UsersModel {
  final String id;
  final String name;
  final String email;

  UsersModel({required this.id, required this.name, required this.email});

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
