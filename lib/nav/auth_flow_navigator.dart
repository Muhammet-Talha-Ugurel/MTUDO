import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_cubit.dart';
import '../bloc/auth/confirm/confirm.dart';
import '../bloc/auth/sign_up/sign_up.dart';

import '../bloc/auth/login/login.dart';

class AuthFlowNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          // Show login
          if (state == AuthState.login) MaterialPage(child: LoginScreen()),

          // Allow push animation
          if (state == AuthState.signUp ||
              state == AuthState.confirmSignUp) ...[
            // Show Sign up
            MaterialPage(child: SignUpScreen()),

            // Show confirm sign up
            if (state == AuthState.confirmSignUp)
              MaterialPage(child: ConfrimScreen())
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
