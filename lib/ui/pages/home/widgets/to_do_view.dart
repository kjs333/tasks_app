import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';
import 'package:tasks_app/ui/pages/detail/detail_page.dart';
import 'package:tasks_app/ui/pages/home/home_page_view_model.dart';

class ToDoView extends HookConsumerWidget {
  final ToDoEntity todo;
  const ToDoView({super.key, required this.todo});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final isDone = useState(todo.isDone);
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: vrc(context).generalBack,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                await ref
                    .read(homePageViewModelProvider.notifier)
                    .toggleDone(id: todo.id, isDone: !todo.isDone);
              },
              child: SizedBox(
                width: 50,
                child: todo.isDone
                    ? Icon(Icons.check_circle)
                    : Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ToDoDetailPage(todo: todo);
                    },
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  todo.title,
                  style: todo.isDone
                      ? TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                await ref
                    .read(homePageViewModelProvider.notifier)
                    .toggleFavorite(id: todo.id, isFavorite: !todo.isFavorite);
              },
              child: SizedBox(
                width: 50,
                child: todo.isFavorite
                    ? Icon(Icons.star)
                    : Icon(Icons.star_border),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () async {
                final result = await showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("삭제 하시겠습니까?", textAlign: TextAlign.center),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text("취소"),
                        ),
                        TextButton(
                          style: ButtonStyle(iconAlignment: IconAlignment.end),
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(
                            "삭제",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
                if (result) {
                  await ref
                      .read(homePageViewModelProvider.notifier)
                      .deleteTodo(id: todo.id);
                }
              },
              child: SizedBox(width: 50, child: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    );
  }
}
