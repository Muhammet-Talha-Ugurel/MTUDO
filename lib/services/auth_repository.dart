import 'package:flutter/foundation.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class AuthRepository {
  Future<String> _getUserIdFromAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final userId = attributes
          .firstWhere((element) => element.userAttributeKey == 'sub')
          .value;
      return userId;
    } catch (e) {
      throw e;
    }
  }

  Future<String?> attemptAutoLogin() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      return session.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      throw e;
    }
  }

  Future<String?> login({
    required String? username,
    required String? password,
  }) async {
    try {
      final result =
          await Amplify.Auth.signIn(username: username!, password: password);
      return result.isSignedIn ? (await _getUserIdFromAttributes()) : null;
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

  Future<bool> confirmSignUp({
    @required String? username,
    @required String? confirmationCode,
  }) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: username!,
        confirmationCode: confirmationCode!,
      );
      return result.isSignUpComplete;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
