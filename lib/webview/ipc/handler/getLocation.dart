import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vacgom_app/location/LocationService.dart';

import '../message/Message.dart';

class GetLocationHandler {
  final BuildContext buildContext;

  GetLocationHandler(
    this.buildContext,
  );

  void register(BehaviorSubject<Message> inputStream) {
    inputStream.stream
        .where((message) => message.type == "GetLocation")
        .listen(handle);
  }

  Future<void> handle(Message message) async {
    LocationService locationService = LocationService();
    final location = await locationService.getLocation();
    print("sent location to webview: ${location.lat}, ${location.lon}");
    message.resolve({
      "lat": location.lat,
      "lon": location.lon,
    });
  }
}
