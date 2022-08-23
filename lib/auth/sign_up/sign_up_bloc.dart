import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_repository.dart';
import '../form_submition_status.dart';
import '/auth/sign_up/sign_up_event.dart';
import '/auth/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;

  SignUpBloc({required this.authRepo}) : super(SignUpState()) {
    on<SignUpUsernameChanged>(_onSignUpUsernameChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }
  void _onSignUpUsernameChanged(
      SignUpUsernameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onSignUpPasswordChanged(
      SignUpPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.login();
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }
}
