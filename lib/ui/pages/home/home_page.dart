import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/data/model/home_page_state.dart';
import 'package:tasks_app/ui/pages/home/home_page_view_model.dart';
import 'package:tasks_app/ui/pages/home/widgets/home_page_bottomsheet.dart';
import 'package:tasks_app/ui/pages/home/widgets/home_page_btm_navigation.dart';
import '../../../data/model/to_do_entity.dart';
import 'widgets/no_to_do.dart';
import 'widgets/sort_btn.dart';
import 'widgets/to_do_view.dart';

class HomePage extends ConsumerWidget {
  final String titleName;
  const HomePage({super.key, required this.titleName});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: vrc(context).bodyBack,
      appBar: AppBar(
        backgroundColor: vrc(context).appBarBack,
        title: Text(
          titleName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      // 투두리스트 비어있으면 그림과 설명, 아니면 할 일 목록 위젯 넣기
      body: state.when(
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
          return Column(
            children: [
              data!.todoList.isEmpty
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
                  : Expanded(child: toDoWidgetList(context, ref, data)),
            ],
          );
        },
      ),
      bottomNavigationBar: HomePageBtmNavigation(),
      // 투두 추가 버튼
      floatingActionButton: FloatingActionButton(
        backgroundColor: fxc(context).brandColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white, size: 24),
        onPressed: () async {
          await showModalBottomSheet<ToDoEntity>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (context) => HomePageBottomsheet(),
          );
        },
      ),
    );
  }

  //저장된 투두리스트를 가지고 ToDoView위젯리스트 만들기
  Widget toDoWidgetList(
    BuildContext context,
    WidgetRef ref,
    HomePageState data,
  ) {
    //완료한 일 포함?
    List<ToDoEntity> todoList;
    if (!data.sortWithDone) {
      todoList = data.todoList.where((todo) => !todo.isDone).toList();
    } else {
      todoList = data.todoList;
    }
    return ListView.builder(
      padding: EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 100),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        ToDoEntity todo = todoList[index];
        return ToDoView(todo: todo);
      },
    );
  }
}
