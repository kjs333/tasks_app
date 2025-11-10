import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/data/model/home_page_state.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';
import 'package:tasks_app/data/repository/to_do_repository.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  final ToDoRepository toDoRepository = ToDoRepository();

  @override
  HomePageState build() {
    getToDos();
    return HomePageState(todoList: [], sortWithDate: true, sortWithDone: true);
  }

  Future<void> getToDos() async {
    final todoList = await toDoRepository.getToDos();
    state.sortWithDate
        ? todoList.sort(compareDate)
        : todoList.sort(compareStar);
    state = state.copyWith(todoList: todoList);
  }

  Future<void> addTodo({required ToDoEntity toDo}) async {
    final result = await toDoRepository.addToDo(toDo);
    if (result) {
      List<ToDoEntity> newList = state.todoList.toList();
      newList.add(toDo);
      //정렬
      if (state.sortWithDate) {
        newList.sort(compareDate);
      } else {
        newList.sort(compareStar);
      }
      if (!state.sortWithDone) {
        newList = newList.where((todo) => !todo.isDone).toList();
      }
      state = state.copyWith(todoList: newList);
    }
  }

  Future<void> updateTodo({required ToDoEntity updated}) async {
    final result = await toDoRepository.updateToDo(updated);
    if (result) {
      List<ToDoEntity> newList = state.todoList.toList();
      final index = newList.indexWhere((e) => e.id == updated.id);
      newList[index] = updated;
      if (state.sortWithDate) {
        newList.sort(compareDate);
      } else {
        newList.sort(compareStar);
      }
      state = state.copyWith(todoList: newList);
    }
  }

  Future<void> toggleFavorite({
    required String id,
    required bool isFavorite,
  }) async {
    final toDo = state.todoList.firstWhere((e) => e.id == id);
    final updated = toDo.copyWith(isFavorite: isFavorite);
    await updateTodo(updated: updated);
  }

  Future<void> toggleDone({required String id, required bool isDone}) async {
    final toDo = state.todoList.firstWhere((e) => e.id == id);
    final updated = toDo.copyWith(isDone: isDone);
    await updateTodo(updated: updated);
  }

  Future<void> deleteTodo({required String id}) async {
    final result = await toDoRepository.deleteToDo(id);
    if (result) {
      List<ToDoEntity> newList = state.todoList
          .where((todo) => todo.id != id)
          .toList();
      //정렬
      if (state.sortWithDate) {
        newList.sort(compareDate);
      } else {
        newList.sort(compareStar);
      }
      state = state.copyWith(todoList: newList);
    }
  }

  void todoListSortWithDate() {
    if (!state.sortWithDate) {
      List<ToDoEntity> sorted = state.todoList.toList();
      sorted.sort(compareDate);
      state = state.copyWith(todoList: sorted, sortWithDate: true);
    }
  }

  void todoListSortWithStar() {
    if (state.sortWithDate) {
      List<ToDoEntity> sorted = state.todoList.toList();
      sorted.sort(compareStar);
      state = state.copyWith(todoList: sorted, sortWithDate: false);
    }
  }

  void todoListWithoutDone() {
    final old = state.sortWithDone;
    state = state.copyWith(sortWithDone: !old);
  }

  int compareDate(ToDoEntity a, ToDoEntity b) =>
      a.createdAt.compareTo(b.createdAt);
  int compareStar(ToDoEntity a, ToDoEntity b) {
    if (a.isFavorite || b.isFavorite) {
      return a.isFavorite ? -1 : 1;
    } else {
      return compareDate(a, b);
    }
  }
}
