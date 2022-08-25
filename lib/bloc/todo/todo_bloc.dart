import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/services/todo_repository.dart';
import '../../models/Todo.dart';
// ===========Todo events=================

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
  TodoBloc() : super(LoadingTodoState()) {
    on<LoadTodosEvent>(_onLoadTodoEvent);
    on<ObserveTodosEvent>(_onObserveTodoEvent);
  }
  void _onLoadTodoEvent(LoadTodosEvent event, Emitter<TodoState> emit) async {
    emit(LoadingTodoState());
    try {
      final todos = await _todoRepo.getTodos();
      emit(LoadedTodoState(todos: todos));
    } catch (e) {
      emit(FaildToLoadTodoState(error: e as Error));
    }
  }

  void _onObserveTodoEvent(
      ObserveTodosEvent event, Emitter<TodoState> emit) async {
    emit(ObserveingTodoState());
    try {
      await _todoRepo.observeTodos();
      LoadTodosEvent();
    } catch (e) {
      emit(FaildToObserveTodoState(error: e as Error));
    }
  }
}
