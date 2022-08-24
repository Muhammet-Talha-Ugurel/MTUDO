// ignore_for_file: unused_import,deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors ,prefer_const_constructors
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../services/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auth_cubit.dart';
import '../form_submition_status.dart';
import 'confirm_bloc.dart';
import 'confirm_event.dart';
import 'confirm_state.dart';

class ConfrimScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => ConfirmationBloc(
                  authRepo: context.read<AuthRepository>(),
                  authCubit: context.read<AuthCubit>(),
                ),
            child: _confirmForm(_formKey)));
  }
}

Widget _confirmForm(GlobalKey<FormState> _formKey) {
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
                  _confirmField(_formKey),
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

Widget _confirmField(GlobalKey<FormState> _formKey) {
  return BlocBuilder<ConfirmationBloc, ConfirmationState>(
    builder: (context, state) {
      return TextFormField(
        autofocus: false,
        obscureText: true,
        validator: (value) => state.isValidCode ? null : 'Not valid',
        onChanged: (value) => context
            .read<ConfirmationBloc>()
            .add(ConfirmationCodeChanged(code: value)),
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
  return BlocBuilder<ConfirmationBloc, ConfirmationState>(
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
                  context.read<ConfirmationBloc>().add(ConfirmationSubmitted());
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
