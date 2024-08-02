import 'dart:ui';

import 'package:equatable/equatable.dart';

class PartnerUser extends Equatable {
  final int id;
  final String? name;
  final bool isMaster;

  PartnerUser({required this.id, required this.name, required this.isMaster});

  Color getColor() {
    if (isMaster) {
      return Color(0xFF4196FD);
    } else {
      return Color(0xFF85D27F);
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, isMaster];
}
