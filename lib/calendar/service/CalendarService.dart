import 'package:vacgom_app/calendar/service/dto/TodoResponse.dart';
import 'package:vacgom_app/calendar/service/dto/TodoSearchResponse.dart';

import '../../auth/model/User.dart';
import '../model/CalendarTodoItem.dart';
import '../model/TodoCompletion.dart';
import '../model/TodoItem.dart';
import 'dto/DayTodoResponse.dart';

class CalendarService {
  Future<Map<String, CalendarTodoItem>> searchTodo(int year, int month) async {
    final response = TodoSearchResponse(dayTodoResponses: [
      DayTodoResponse(date: DateTime(2024, 7, 26), todoResponses: [
        TodoResponse(
            id: 1,
            title: "title",
            memo: "메모",
            date: DateTime(2024, 7, 26),
            userId: 1,
            isDone: true),
        TodoResponse(
            id: 2,
            title: "title",
            memo: "메모",
            date: DateTime(2024, 7, 26),
            userId: 1,
            isDone: false),
        TodoResponse(
            id: 3,
            title: "title",
            memo: "메모",
            date: DateTime(2024, 7, 26),
            userId: 2,
            isDone: true),
      ])
    ]);

    return convertToCalendarTodoMap(response);
  }

  Future<Map<String, CalendarTodoItem>> convertToCalendarTodoMap(
      TodoSearchResponse response) async {
    Map<String, CalendarTodoItem> calendarTodoMap = {};

    for (var dayTodoResponse in response.dayTodoResponses) {
      String dateKey = dayTodoResponse.date
          .toIso8601String()
          .split('T')[0]; // Use date part as key

      List<TodoCompletion> todoCompletions = [];

      int totalTodoCount = dayTodoResponse.todoResponses.length;
      // Group todos by userId (including null userId)
      Map<User, List<TodoResponse>> groupedByUser = {};
      List<TodoResponse> unassignedTodos = [];

      for (var todoResponse in dayTodoResponse.todoResponses) {
        if (todoResponse.userId == null) {
          unassignedTodos.add(todoResponse);
          continue;
        }

        User user = await getUser(todoResponse.userId!);
        if (!groupedByUser.containsKey(user)) {
          groupedByUser[user] = [];
        }
        groupedByUser[user]!.add(todoResponse);
      }

      // Create TodoCompletion for each user
      groupedByUser.forEach((user, todos) async {
        List<TodoItem> todoItems = todos
            .map((todo) => TodoItem(
                  user: user,
                  title: todo.title,
                  memo: todo.memo,
                  isDone: todo.isDone,
                ))
            .toList();
        print(todoItems);

        double completionRate = todoItems.isEmpty
            ? 0.0
            : todoItems.where((item) => item.isDone).length / totalTodoCount;

        print(completionRate);
        todoCompletions.add(TodoCompletion(
          user: user,
          todoItems: todoItems,
          completionRate: completionRate,
        ));
      });
      todoCompletions
          .sort((a, b) => b.completionRate.compareTo(a.completionRate));

      calendarTodoMap[dateKey] = CalendarTodoItem(
          userTodoCompletions: todoCompletions,
          unassignedTodoCompletion: TodoCompletion(
              user: null,
              todoItems: unassignedTodos
                  .map((todo) => TodoItem(
                        user: null,
                        title: todo.title,
                        memo: todo.memo,
                        isDone: todo.isDone,
                      ))
                  .toList(),
              completionRate: 0.0));
    }

    return calendarTodoMap;
  }

  Future<User> getUser(int id) async {
    if (id == 1) {
      return User(
          id: 1,
          role: "ROLE_USER",
          name: "형주",
          profileImageUrl:
              "https://avatars.githubusercontent.com/u/44080404?v=4",
          color: "#4196FD");
    } else {
      return User(
          id: 2,
          role: "ROLE_USER",
          name: "형주2",
          profileImageUrl:
              "https://avatars.githubusercontent.com/u/44080404?v=4",
          color: "#86D37F");
    }
  }
}
