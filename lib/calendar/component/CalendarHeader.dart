import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/component/CalendarMonthIndicator.dart';

class CalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalendarMonthIndicator(
                  year: state.datetime.year.toString(),
                  month: state.datetime.month.toString(),
                  onPrevMonth: () {
                    context
                        .read<CalendarBloc>()
                        .add(ChangeMonthEvent(move: -1));
                  },
                  onNextMonth: () {
                    context.read<CalendarBloc>().add(ChangeMonthEvent(move: 1));
                  },
                )
              ],
            ));
      },
    );
  }
}
