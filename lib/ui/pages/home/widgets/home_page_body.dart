import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';
import 'package:tasks_app/ui/pages/home/home_page_view_model.dart';
import 'package:tasks_app/ui/pages/home/widgets/no_to_do.dart';
import 'package:tasks_app/ui/pages/home/widgets/sort_btn.dart';
import 'package:tasks_app/ui/pages/home/widgets/to_do_view.dart';

class HomePageBody extends ConsumerWidget {
  final String titleName;
  const HomePageBody({super.key, required this.titleName});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    return state.when(
      skipError: true,
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: false,
      loading: () => Center(
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stackTrace) => Text("에러: $error"),
      data: (data) {
        if (data == null) {
          return SizedBox();
        }
        List<ToDoEntity> todoList;
        if (!data.sortWithDone) {
          todoList = data.todoList.where((todo) => !todo.isDone).toList();
        } else {
          todoList = data.todoList;
        }
        return Column(
          children: [
            data.todoList.isEmpty
                ? SizedBox()
                : SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: SortBtn(
                            btnOn: data.sortWithDate,
                            text: "저장순",
                            onTap: (ref) {
                              ref
                                  .read(homePageViewModelProvider.notifier)
                                  .toggleSortWithDate();
                            },
                          ),
                        ),
                        Expanded(
                          child: SortBtn(
                            btnOn: !data.sortWithDate,
                            text: "중요순",
                            onTap: (ref) {
                              ref
                                  .read(homePageViewModelProvider.notifier)
                                  .toggleSortWithStar();
                            },
                          ),
                        ),
                        Expanded(
                          child: SortBtn(
                            btnOn: data.sortWithDone,
                            text: "완료 포함",
                            onTap: (ref) {
                              ref
                                  .read(homePageViewModelProvider.notifier)
                                  .toggleSortWithDone();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            data.todoList.isEmpty
                ? NoToDo(titleName: titleName)
                : Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(
                        top: 12,
                        left: 12,
                        right: 12,
                        bottom: 100,
                      ),
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        ToDoEntity todo = todoList[index];
                        return ToDoView(todo: todo);
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
