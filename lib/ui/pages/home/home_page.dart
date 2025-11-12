import 'package:flutter/material.dart';
import 'package:tasks_app/core/app_theme.dart';
import 'package:tasks_app/ui/pages/home/widgets/home_page_body.dart';
import 'package:tasks_app/ui/pages/home/widgets/home_page_bottomsheet.dart';
import 'package:tasks_app/ui/pages/home/widgets/home_page_btm_navigation.dart';
import '../../../data/model/to_do_entity.dart';

class HomePage extends StatelessWidget {
  final String titleName;
  const HomePage({super.key, required this.titleName});
  @override
  Widget build(BuildContext context) {
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
      body: HomePageBody(titleName: titleName),
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
}
