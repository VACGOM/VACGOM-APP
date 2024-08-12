import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vacgom_app/api/dto/todo/CreateTodo.dart';

import '../../api/api.dart';
import '../../auth/model/User.dart';
import '../model/CalendarGroup.dart';
import '../model/VacgomTodoItem.dart';
import '../model/VacgomTodoMap.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final RestClient restClient;

  CalendarBloc(this.restClient) : super(CalendarInitial()) {
    on<InitEvent>((event, emit) async {
      print("InitEvent");

      final todo = await this.restClient.getTodo();
      print(todo);
      Map<int, VacgomTodoItem> todoItems = {};

      todo.data.forEach((element) {
        element.todoList.forEach((element) {
          todoItems[element.todoId] = VacgomTodoItem(
            todoId: element.todoId,
            title: element.title,
            date: element.date,
            isDone: element.isDone,
            memberId: element.memberId,
          );
        });
      });

      emit(CalendarState(DateTime.now(), CalendarGroup.create(DateTime.now()),
          VacgomTodoMap(todoItems: todoItems)));
    });

    on<ChangeMonthEvent>((event, emit) async {
      DateTime newDateTime = state.datetime
          .copyWith(month: state.datetime.month + event.move, day: 1);

      emit(CalendarState(
          newDateTime, CalendarGroup.create(newDateTime), state.todoMap));
    });

    on<SelectDayEvent>((event, emit) {
      if (event.isPrev) {
        DateTime newDateTime = state.datetime.copyWith(
          day: event.date.day,
          month: event.date.month,
        );

        emit(CalendarState(
            newDateTime, CalendarGroup.create(newDateTime), state.todoMap));
      } else if (event.isNext) {
        DateTime newDateTime = state.datetime.copyWith(
          day: event.date.day,
          month: event.date.month,
        );

        emit(CalendarState(
            newDateTime, CalendarGroup.create(newDateTime), state.todoMap));
      } else {
        DateTime newDateTime = state.datetime.copyWith(
          day: event.date.day,
          month: event.date.month,
        );

        emit(CalendarState(newDateTime, state.calendarGroup, state.todoMap));
      }
    });

    on<MarkUndoneEvent>((event, emit) {
      print("MarkUndoneEvent");
      print(event.todoItem);

      event.todoItem.isDone = false;
      event.todoItem.memberId = null;

      emit(CalendarState(state.datetime, state.calendarGroup, state.todoMap));
    });

    on<MarkDoneEvent>((event, emit) {
      print("MarkDoneEvent");
      print(event.todoItem);

      event.todoItem.isDone = true;
      event.todoItem.memberId = event.user.id;

      print(
          "${event.todoItem.todoId} ${event.todoItem.isDone} ${event.user.id}");

      emit(CalendarState(state.datetime, state.calendarGroup, state.todoMap));
    });

    on<TodoAddedEvent>((event, emit) {
      print("TodoAddedEvent");
      print(event.todo);

      final todo = VacgomTodoItem(
          todoId: state.todoMap.todoItems.length + 1,
          title: event.todo,
          date: state.datetime,
          isDone: false,
          memberId: null);

      state.todoMap.todoItems[todo.todoId] = todo;

      print(state.datetime.toIso8601String().split("T")[0]);
      restClient.addTodo(CreateTodo(
          title: event.todo,
          date: state.datetime.toIso8601String().split("T")[0]));
      emit(CalendarState(state.datetime, state.calendarGroup, state.todoMap));
    });
  }
}
