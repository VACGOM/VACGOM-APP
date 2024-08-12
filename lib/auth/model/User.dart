import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'PartnerUser.dart';

class User extends Equatable {
  final int id;
  final String role;
  final String? name;
  final String? babyName;
  final String profileImageUrl;
  final String color;
  final bool isMaster;
  final String sex;
  final PartnerUser? partnerUser;

  User(
      {required this.id,
      required this.role,
      required this.name,
      required this.babyName,
      required this.profileImageUrl,
      required this.color,
      required this.isMaster,
      required this.sex,
      required this.partnerUser});

  static User empty() {
    return User(
        id: -1,
        role: "",
        name: "",
        babyName: "",
        profileImageUrl: "",
        color: "",
        isMaster: false,
        sex: "M",
        partnerUser: null);
  }

  Color getColor() {
    if (isMaster) {
      return Color(0xFF4196FD);
    } else {
      return Color(0xFF85D27F);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, role, name, profileImageUrl, color];
}
