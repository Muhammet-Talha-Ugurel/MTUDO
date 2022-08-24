import 'package:flutter/foundation.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthRepository {
  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  Future<bool> attemptAutoLogin() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      print(session.isSignedIn);
      return session.isSignedIn;
    } catch (e) {
      throw e;
    }
  }

  Future<AuthUser?> login({
    required String? username,
    required String? password,
  }) async {
    try {
      final result =
          await Amplify.Auth.signIn(username: username!, password: password);
      return result.isSignedIn ? (await getCurrentUser()) : null;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> signUp({
    @required String? username,
    @required String? email,
    @required String? password,
  }) async {
    Map<CognitoUserAttributeKey, String> userAttributes = {
      CognitoUserAttributeKey.email: email!,
      CognitoUserAttributeKey.preferredUsername: username!,
    };
    final options = CognitoSignUpOptions(userAttributes: userAttributes);
    try {
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password!,
        options: options,
      );
      return result.isSignUpComplete;
    } catch (e) {
      throw e;
    }
  }

  Future<AuthUser?> confirmSignUp({
    required String? username,
    required String confirmationCode,
  }) async {
    try {
      print('confirm sing up cagirildi');
      print(username);
      final result = await Amplify.Auth.confirmSignUp(
        username: username!,
        confirmationCode: confirmationCode,
      );
      return result.isSignUpComplete ? (await getCurrentUser()) : null;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
