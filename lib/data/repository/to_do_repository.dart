import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks_app/data/model/to_do_entity.dart';

class ToDoRepository {
  final firestore = FirebaseFirestore.instance;
  Future<bool> addToDo(ToDoEntity toDo) async {
    try {
      final colRef = firestore.collection('todos');
      final docRef = colRef.doc(toDo.id);
      await docRef.set(toDo.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateToDo(ToDoEntity toDo) async {
    try {
      final colRef = firestore.collection('todos');
      final docRef = colRef.doc(toDo.id);
      await docRef.update(toDo.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteToDo(String id) async {
    try {
      final colRef = firestore.collection('todos');
      final docRef = colRef.doc(id);
      await docRef.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<ToDoEntity>> getToDos() async {
    try {
      final colRef = firestore.collection('todos');
      final querySnapshot = await colRef.get();
      final documents = querySnapshot.docs;
      List<ToDoEntity> todoList = [];

      for (var i = 0; i < documents.length; i++) {
        final data = documents[i].data();
        todoList.add(ToDoEntity.fromJson(data));
      }

      return todoList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
