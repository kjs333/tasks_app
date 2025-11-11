import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/ui/pages/home/home_page_view_model.dart';
import '../../../data/model/to_do_entity.dart';

class ToDoDetailPage extends HookConsumerWidget {
  final ToDoEntity todo;
  const ToDoDetailPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: todo.title);
    final descController = useTextEditingController(text: todo.description);
    final isFavorite = useState(todo.isFavorite);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          //뒤로가기
          leading: GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(Icons.arrow_back),
            ),
            onTap: () async {
              if (titleController.text.isNotEmpty) {
                ToDoEntity updatedTodo = todo.copyWith(
                  title: titleController.text,
                  description: descController.text,
                  isFavorite: isFavorite.value,
                );
                await ref
                    .read(homePageViewModelProvider.notifier)
                    .updateTodo(updated: updatedTodo);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.deepPurple,
                    content: Text(
                      "할 일을 입력해주세요.",
                      style: TextStyle(color: Colors.grey[200]),
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                isFavorite.value = !isFavorite.value;
              },
              child: isFavorite.value
                  ? Icon(Icons.star, size: 24, color: vrc(context).blackVSwhite)
                  : Icon(Icons.star_border, color: vrc(context).blackVSwhite),
            ),
            SizedBox(width: 18),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //타이틀
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  style: TextStyle(
                    color: vrc(context).textColor300,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decorationThickness: 0,
                  ),
                  maxLength: 20,
                  maxLines: 1,
                  controller: titleController,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    counterText: "", // 글자수 카운트 없애기
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    SizedBox(width: 50, child: Icon(Icons.short_text_rounded)),
                    Expanded(child: Text("세부 내용은 다음과 같습니다.")),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    right: 25,
                    left: 25,
                    bottom: 25,
                  ),
                  child: TextField(
                    maxLines: null,
                    controller: descController,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      counterText: "", // 글자수 카운트 없애기
                      hintText: "세부 내용은 여기에 작성합니다.",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(decorationThickness: 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
