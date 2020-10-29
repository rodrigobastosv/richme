import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  final int id;
  final String name;
  final String email;
  final String password;

  UserModel copyWith({
    int id,
    String name,
    String email,
    String password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  List<Object> get props => [id, name, email, password];

  @override
  bool get stringify => true;
}
