import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/services/data_repository.dart';
import '../../models/User.dart';
import '../auth/auth_credentials.dart';
import '../../services/auth_repository.dart';
import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepo;
  final DataRepository dataRepo;

  SessionCubit({
    required this.authRepo,
    required this.dataRepo,
  }) : super(UnknownSessionState()) {
    attemptAutoLogin();
  }

  void attemptAutoLogin() async {
    try {
      final userID = await authRepo.getCurrentUser();
      User? user = await dataRepo.getUserById(userID.userId);
      if (user == null) {
        await dataRepo.createUser(
          userId: userID.userId,
          username: "",
          email: userID.username,
        );
      }

      final userId = await authRepo.attemptAutoLogin();
      if (userId == true) {
        emit(Authenticated());
      } else if (userId == false) {
        emit(Unauthenticated());
      }
    } on Exception {
      emit(Unauthenticated());
    }
  }

  void showAuth() => emit(Unauthenticated());

  void showSession(AuthCredentials credentials) async {
    try {
      emit(Authenticated());
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  void signOut() {
    authRepo.signOut();
    emit(Unauthenticated());
  }
}
