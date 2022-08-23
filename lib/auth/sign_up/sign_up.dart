// ignore_for_file: unused_import,deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors ,prefer_const_constructors
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mtudo/auth/auth_repository.dart';
import 'package:mtudo/auth/form_submition_status.dart';
import 'package:mtudo/auth/login/login_event.dart';
import '/screns/singin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) =>
                SignUpBloc(authRepo: context.read<AuthRepository>()),
            child: _loginForm(_formKey)));
  }
}

Widget _loginForm(GlobalKey<FormState> _formKey) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/zeen1.jpg"), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 44.0,
                  ),
                  Text(
                    'MTUDO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Text(
                    'Hosgeldiniz',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 44.0,
                  ),
                  _emailField(_formKey),
                  SizedBox(
                    height: 44.0,
                  ),
                  _passwordField(_formKey),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Hesabin yok mu? "),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Kaydol",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 88.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: _submitionButton(_formKey),
                  ),
                ]),
          ),
        ),
      ),
    ),
  );
}

Widget _emailField(GlobalKey<FormState> _formKey) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return TextFormField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              state.isValidUsername ? null : 'It is not Valid username',
          onChanged: (value) => context
              .read<SignUpBloc>()
              .add(SignUpUsernameChanged(username: value)),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.mail,
                color: Color.fromARGB(255, 58, 56, 56),
              )));
    },
  );
}

Widget _passwordField(GlobalKey<FormState> _formKey) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return TextFormField(
        autofocus: false,
        obscureText: true,
        validator: (value) => state.isValidPassword ? null : 'Not valid',
        onChanged: (value) => context
            .read<SignUpBloc>()
            .add(SignUpPasswordChanged(password: value)),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: "Sifre",
            prefixIcon: Icon(
              Icons.lock,
              color: Color.fromARGB(255, 58, 56, 56),
            )),
      );
    },
  );
}

Widget _submitionButton(GlobalKey<FormState> _formKey) {
  return BlocBuilder<SignUpBloc, SignUpState>(
    builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : RawMaterialButton(
              fillColor: Color.fromARGB(255, 58, 56, 56),
              elevation: 0.0,
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<SignUpBloc>().add(SignUpSubmitted());
                }
              },
              child: Text(
                "Giris yap",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            );
    },
  );
}
