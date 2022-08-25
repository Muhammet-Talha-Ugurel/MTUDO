import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/bloc/auth/login/login.dart';
import 'package:mtudo/screns/home.dart';
import 'package:mtudo/screns/todo_view.dart';
import 'bloc/auth/auth_cubit.dart';
import 'bloc/auth/auth_navigator.dart';
import 'screns/loadingview.dart';
import 'bloc/session/session_cubit.dart';
import 'bloc/session/session_state.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show loading screen
          if (state is UnknownSessionState) MaterialPage(child: LoadingView()),

          // Show auth flow
          if (state is Unauthenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) =>
                    AuthCubit(sessionCubit: context.read<SessionCubit>()),
                child: AuthNavigator(),
              ),
            ),

          // Show session flow
          if (state is Authenticated) MaterialPage(child: HomeScreen())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
