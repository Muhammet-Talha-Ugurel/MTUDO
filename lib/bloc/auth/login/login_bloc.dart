import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/bloc/auth/auth_cubit.dart';
import '../auth_credentials.dart';
import '../../../services/auth_repository.dart';
import '../form_submition_status.dart';
import '/bloc/auth/login/login_event.dart';
import '/bloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  LoginBloc({required this.authRepo, required this.authCubit})
      : super(LoginState()) {
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  void _onLoginUsernameChanged(
      LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      final userId = await authRepo.login(
        username: state.username,
        password: state.password,
      );
      emit(state.copyWith(formStatus: SubmissionSuccess()));
      authCubit.launchSession(AuthCredentials(
        username: state.username,
        userId: userId,
      ));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }
}
