import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtudo/bloc/panel/panel_bloc.dart';
import 'package:mtudo/bloc/panel/panel_event.dart';
import 'package:mtudo/screns/home.dart';
import '../bloc/auth/auth_cubit.dart';
import 'auth_flow_navigator.dart';
import '../screns/loadingview.dart';
import '../bloc/session/session_cubit.dart';
import '../bloc/session/session_state.dart';

class AuthNavigator extends StatelessWidget {
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
                child: AuthFlowNavigator(),
              ),
            ),

          // Show session flow
          if (state is Authenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) => PanelBloc()..add(LoadPanelEvent()),
                child: HomeScreen(),
              ),
            ),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
