class CalendarGroupEntry {
  final DateTime date;
  final String text;
  final bool isPreviousMonth;
  final bool isNextMonth;

  CalendarGroupEntry(
      {required this.date,
      required this.text,
      required this.isPreviousMonth,
      required this.isNextMonth});
}
