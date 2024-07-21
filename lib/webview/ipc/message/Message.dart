class Message<Req, Res extends Map<String, dynamic>> {
  final String type;
  final Req data;
  final Function(dynamic res) resolve;

  Message({required this.type, required this.data, required this.resolve});

  @override
  String toString() {
    return 'Message{type: $type, data: $data, resolve: $resolve}';
  }
}
