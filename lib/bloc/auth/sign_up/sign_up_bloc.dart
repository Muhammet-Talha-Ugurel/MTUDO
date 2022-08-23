import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/bloc/auth/auth_cubit.dart';
import '../../../services/auth_repository.dart';
import '../form_submition_status.dart';
import '/bloc/auth/sign_up/sign_up_event.dart';
import '/bloc/auth/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  SignUpBloc({required this.authRepo, required this.authCubit})
      : super(SignUpState()) {
    on<SignUpUsernameChanged>(_onSignUpUsernameChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }
  void _onSignUpUsernameChanged(
      SignUpUsernameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onSignUpEmailChanged(
      SignUpEmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onSignUpPasswordChanged(
      SignUpPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.signUp(
        username: state.username,
        email: state.email,
        password: state.password,
      );
      authCubit.showConfirmSignUp(
        username: state.username,
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }
}
