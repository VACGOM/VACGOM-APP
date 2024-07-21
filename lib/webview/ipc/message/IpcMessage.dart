import 'package:json_annotation/json_annotation.dart';

part 'IpcMessage.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class IpcMessage<T> {
  String type;
  final T data;
  String? id;

  IpcMessage({required this.type, required this.data, required this.id});

  factory IpcMessage.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$IpcMessageFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$IpcMessageToJson(this, toJsonT);
}
