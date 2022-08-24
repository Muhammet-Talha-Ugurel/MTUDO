import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_cubit.dart';
import '../../../services/auth_repository.dart';
import '../form_submition_status.dart';
import 'confirm_event.dart';
import 'confirm_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthCubit authCubit;

  ConfirmationBloc({
    required this.authRepo,
    required this.authCubit,
  }) : super(ConfirmationState()) {
    on<ConfirmationCodeChanged>(_onConfirmationCodeChanged);
    on<ConfirmationSubmitted>(_onConfirmationSubmitted);
  }
  void _onConfirmationCodeChanged(
      ConfirmationCodeChanged event, Emitter<ConfirmationState> emit) {
    emit(state.copyWith(code: event.code));
  }

  void _onConfirmationSubmitted(
      ConfirmationSubmitted event, Emitter<ConfirmationState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepo.confirmSignUp(
        username: authCubit.credentials.username,
        confirmationCode: state.code,
      );

      emit(state.copyWith(formStatus: SubmissionSuccess()));

      final credentials = authCubit.credentials;
      print(credentials.username);
      print(credentials.password);
      final userId = await authRepo.login(
        username: credentials.username,
        password: credentials.password,
      );
      credentials.userId = userId?.userId;

      authCubit.launchSession(credentials);
    } catch (e) {
      print(e);
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    // Confirmation code updated
    if (event is ConfirmationCodeChanged) {
      yield state.copyWith(code: event.code);

      // Form submitted
    } else if (event is ConfirmationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
    }
  }
}
