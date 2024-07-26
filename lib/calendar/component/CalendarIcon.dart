import 'package:flutter/cupertino.dart';
import 'package:vacgom_app/calendar/model/CalendarItem.dart';

abstract class CalendarIcon extends StatelessWidget {
  final CalendarItem item;

  CalendarIcon({required this.item});
}
