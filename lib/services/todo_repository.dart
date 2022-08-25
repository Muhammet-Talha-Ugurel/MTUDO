import '../models/Todo.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class TodoRepository {
  Future<List<Todo>> getTodos() async {
    try {
      final todos = await Amplify.DataStore.query(Todo.classType);
      return todos;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTodo(
      String title, String userId, String panelrowId) async {
    final newTodo = Todo(
        title: title,
        isComplete: false,
        userID: userId,
        panelrowID: panelrowId);
    try {
      await Amplify.DataStore.save(newTodo);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateTodoIsComplete(Todo todo, bool isComplete) async {
    final updatedTodo = todo.copyWith(isComplete: isComplete);
    try {
      await Amplify.DataStore.save(updatedTodo);
    } catch (e) {
      throw e;
    }
  }

  Stream observeTodos() {
    return Amplify.DataStore.observe(Todo.classType);
  }
}