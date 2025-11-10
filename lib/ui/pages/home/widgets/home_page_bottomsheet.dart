import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';
import 'package:tasks_app/ui/pages/home/home_page_view_model.dart';

import 'package:uuid/uuid.dart';

class HomePageBottomsheet extends HookConsumerWidget {
  HomePageBottomsheet({super.key});
  final uuid = Uuid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    final detailBtnClicked = useState(false);
    final isTitleNotEmpty = useState(false);
    final isFavorite = useState(false);
    return Padding(
      padding: EdgeInsets.only(
        top: 12,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: detailBtnClicked.value ? 200 : 90,
        child: Column(
          children: [
            Expanded(
              child: TextField(
                maxLines: 1,
                maxLength: 20,
                textInputAction: TextInputAction.done,
                autofocus: true,
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "새 할 일",
                  counterText: "", // 글자수 카운트 없애기
                  border: InputBorder.none,
                ),
                onChanged: (text) {
                  // 텍스트 필드에 변화있을 때마다 확인하고 isTitleNotEmpty값 바꿔주기
                  if (text.trim().isEmpty) {
                    isTitleNotEmpty.value = false;
                  } else {
                    isTitleNotEmpty.value = true;
                  }
                },
                onSubmitted: (value) async {
                  if (isTitleNotEmpty.value) {
                    ToDoEntity newTodo = ToDoEntity(
                      id: uuid.v4(),
                      title: titleController.text,
                      description: descController.text,
                      isFavorite: isFavorite.value,
                      isDone: false,
                      createdAt: DateTime.now(),
                    );
                    await ref
                        .read(homePageViewModelProvider.notifier)
                        .addTodo(toDo: newTodo);
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.deepPurple,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "할 일을 입력해주세요.",
                          style: TextStyle(color: Colors.grey[200]),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
            detailBtnClicked.value
                ? Expanded(
                    flex: 2,
                    child: TextField(
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      controller: descController,
                      decoration: InputDecoration(
                        hintText: "세부정보 추가",
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                : SizedBox(),
            Expanded(
              child: Row(
                children: [
                  // 설명 추가 아이콘
                  detailBtnClicked.value
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () {
                            detailBtnClicked.value = true;
                          },
                          child: SizedBox(
                            height: 40,
                            child: Icon(Icons.short_text_rounded, size: 24),
                          ),
                        ),
                  // 별 아이콘
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isFavorite.value = !isFavorite.value;
                      },
                      child: Icon(
                        isFavorite.value ? Icons.star : Icons.star_border,
                        size: 24,
                      ),
                    ),
                  ),
                  Spacer(flex: 5),
                  //저장 버튼
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        if (isTitleNotEmpty.value) {
                          ToDoEntity newTodo = ToDoEntity(
                            id: uuid.v4(),
                            title: titleController.text,
                            description: descController.text,
                            isFavorite: isFavorite.value,
                            isDone: false,
                            createdAt: DateTime.now(),
                          );
                          await ref
                              .read(homePageViewModelProvider.notifier)
                              .addTodo(toDo: newTodo);
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepPurple,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "할 일을 입력해주세요.",
                                style: TextStyle(color: Colors.grey[200]),
                              ),
                              duration: Duration(seconds: 1),
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "저장",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          color: isTitleNotEmpty.value
                              ? vrc(context).textColor100
                              : vrc(context).textColor200,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
