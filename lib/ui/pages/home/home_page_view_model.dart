import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks_app/data/model/home_page_state.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';
import 'package:tasks_app/data/repository/to_do_repository.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  final ToDoRepository toDoRepository = ToDoRepository();

  @override
  Future<HomePageState> build() async {
    state = AsyncLoading();
    List<ToDoEntity> todoList = await toDoRepository.getToDos();
    todoList.sort(compareDate);
    return HomePageState(
      todoList: todoList,
      sortWithDate: true,
      sortWithDone: true,
    );
  }

  Future<void> getToDos() async {
    final todoList = await toDoRepository.getToDos();
    state.value!.sortWithDate
        ? todoList.sort(compareDate)
        : todoList.sort(compareStar);
    state = AsyncData(state.value!.copyWith(todoList: todoList));
  }

  Future<void> addTodo({required ToDoEntity toDo}) async {
    final result = await toDoRepository.addToDo(toDo);
    if (result) {
      List<ToDoEntity> newList = state.value!.todoList.toList();
      newList.add(toDo);
      //정렬
      toDoListSort(newList);
    }
  }

  Future<void> updateTodo({required ToDoEntity updated}) async {
    final result = await toDoRepository.updateToDo(updated);
    if (result) {
      List<ToDoEntity> newList = state.value!.todoList.toList();
      final index = newList.indexWhere((e) => e.id == updated.id);
      newList[index] = updated;
      //정렬
      toDoListSort(newList);
    }
  }

  Future<void> toggleFavorite({
    required String id,
    required bool isFavorite,
  }) async {
    final toDo = state.value!.todoList.firstWhere((e) => e.id == id);
    final updated = toDo.copyWith(isFavorite: isFavorite);
    await updateTodo(updated: updated);
  }

  Future<void> toggleDone({required String id, required bool isDone}) async {
    final toDo = state.value!.todoList.firstWhere((e) => e.id == id);
    final updated = toDo.copyWith(isDone: isDone);
    await updateTodo(updated: updated);
  }

  Future<void> deleteTodo({required String id}) async {
    final result = await toDoRepository.deleteToDo(id);
    if (result) {
      List<ToDoEntity> newList = state.value!.todoList
          .where((todo) => todo.id != id)
          .toList();
      //정렬
      toDoListSort(newList);
    }
  }

  void toDoListSort([List<ToDoEntity>? newList]) {
    newList ??= state.value!.todoList.toList();
    if (state.value!.sortWithDate) {
      newList.sort(compareDate);
    } else {
      newList.sort(compareStar);
    }
    state = AsyncData(state.value!.copyWith(todoList: newList));
  }

  void toggleSortWithDate() {
    if (!state.value!.sortWithDate) {
      state = AsyncData(state.value!.copyWith(sortWithDate: true));
      toDoListSort();
    }
  }

  void toggleSortWithStar() {
    if (state.value!.sortWithDate) {
      state = AsyncData(state.value!.copyWith(sortWithDate: false));
      toDoListSort();
    }
  }

  void toggleSortWithDone() {
    final old = state.value!.sortWithDone;
    state = AsyncData(state.value!.copyWith(sortWithDone: !old));
  }

  int compareDate(ToDoEntity a, ToDoEntity b) =>
      a.createdAt.compareTo(b.createdAt);
  int compareStar(ToDoEntity a, ToDoEntity b) {
    if ((a.isFavorite && b.isFavorite) || (!a.isFavorite && !b.isFavorite)) {
      return compareDate(a, b);
    } else {
      return a.isFavorite ? -1 : 1;
    }
  }
}
