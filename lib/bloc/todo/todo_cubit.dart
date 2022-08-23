import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/bloc/todo/todo_repository.dart';

import '../../models/Todo.dart';

abstract class TodoState {}

class LoadingTodos extends TodoState {}

class ListTodosSuccess extends TodoState {
  final List<Todo> todos;

  ListTodosSuccess({required this.todos});
}

class ListTodosFailure extends TodoState {
  final Exception exception;

  ListTodosFailure({required this.exception});
}

class TodoCubit extends Cubit<TodoState> {
  final _todoRepo = TodoRepository();

  TodoCubit() : super(LoadingTodos());

  void getTodos() async {
    if (state is ListTodosSuccess == false) {
      emit(LoadingTodos());
    }

    try {
      final todos = await _todoRepo.getTodos();
      emit(ListTodosSuccess(todos: todos));
    } catch (e) {
      emit(ListTodosFailure(exception: e as Exception));
    }
  }

  void observeTodo() {
    final todosStream = _todoRepo.observeTodos();
    todosStream.listen((_) => getTodos());
  }

  void createTodo(String title) async {
    await _todoRepo.createTodo(title);
    getTodos();
  }

  void updateTodoIsComplete(Todo todo, bool isComplete) async {
    await _todoRepo.updateTodoIsComplete(todo, isComplete);
    getTodos();
  }
}

// ===========Todo events=================
/*
abstract class TodoEvent {}

class LoadTodosEvent extends TodoEvent {}

class UpdateTodosEvent extends TodoEvent {}

class DelteTodoEvent extends TodoEvent {}

class ObserveTodosEvent extends TodoEvent {}

// ============Todo States=================

abstract class TodoState {}

class LoadingTodoState extends TodoState {}

class LoadedTodoState extends TodoState {
  List<Todo> todos;
  LoadedTodoState({required this.todos});
}

class FaildToLoadTodoState extends TodoState {
  Error error;
  FaildToLoadTodoState({required this.error});
}

class UpdateingTodoState extends TodoState {}

class UpdatedTodoState extends TodoState {
  List<Todo> todos;
  UpdatedTodoState({required this.todos});
}

class FaildToUpdateTodoState extends TodoState {
  Error error;
  FaildToUpdateTodoState({required this.error});
}

class DeletingTodoState extends TodoState {}

class DeletedTodoState extends TodoState {
  List<Todo> todos;
  DeletedTodoState({required this.todos});
}

class FaildToDeleteTodoState extends TodoState {
  Error error;
  FaildToDeleteTodoState({required this.error});
}

class ObserveingTodoState extends TodoState {}

class ObservedTodoState extends TodoState {
  List<Todo> todos;
  ObservedTodoState({required this.todos});
}

class FaildToObserveTodoState extends TodoState {
  Error error;
  FaildToObserveTodoState({required this.error});
}

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final _todoRepo = TodoRepository();
  TodoBloc() : super(LoadingTodoState());
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is LoadTodosEvent) {
      yield LoadingTodoState();
      try {
        final todos = await _todoRepo.getTodos();
        yield LoadedTodoState(todos: todos);
      } catch (e) {
        yield FaildToLoadTodoState(error: e as Error);
      }
    } else if (event is ObserveTodosEvent) {
      yield ObserveingTodoState();
      try {
        await _todoRepo.observeTodos();
        LoadTodosEvent();
      } catch (e) {
        yield FaildToObserveTodoState(error: e as Error);
      }
    }
  }
}
*/