import 'package:flutter/cupertino.dart';
import 'package:vacgom_app/calendar/model/VacgomTodoDay.dart';

abstract class CalendarIcon extends StatelessWidget {
  final VacgomTodoDay item;
  final bool isSelected;

  CalendarIcon({required this.item, this.isSelected = false});
}
