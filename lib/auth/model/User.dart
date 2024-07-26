import 'dart:ui';

import 'package:equatable/equatable.dart';

enum Role { admin, user }

class User extends Equatable {
  final int id;
  final String role;
  final String name;
  final String profileImageUrl;
  final String color;

  User(
      {required this.id,
      required this.role,
      required this.name,
      required this.profileImageUrl,
      required this.color});

  static User empty() {
    return User(id: -1, role: "", name: "", profileImageUrl: "", color: "");
  }

  Color getColor() {
    return Color(int.parse(this.color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, role, name, profileImageUrl, color];
}
