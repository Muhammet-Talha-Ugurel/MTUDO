// ignore_for_file: unused_import,deprecated_member_use, sized_box_for_whitespace, use_key_in_widget_constructors ,prefer_const_constructors
import 'package:flutter/material.dart';
import '/screns/singin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailControler,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Lutfen mail giriniz");
        }
      },
      onSaved: (value) {
        emailControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "Email",
          prefixIcon: Icon(
            Icons.mail,
            color: Color.fromARGB(255, 58, 56, 56),
          )),
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordControler,
      validator: (value) {
        if (value!.length < 6) {
          return ("Sifre en az 6 hane olmalidir");
        }
      },
      onSaved: (value) {
        passwordControler.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Sifre",
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 58, 56, 56),
          )),
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/zeen1.jpg"), fit: BoxFit.cover)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            key: _formKey,
            child: Form(
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
                    emailField,
                    SizedBox(
                      height: 44.0,
                    ),
                    passwordField,
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hesabin yok mu? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingInPage()));
                          },
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
                      child: RawMaterialButton(
                        fillColor: Color.fromARGB(255, 58, 56, 56),
                        elevation: 0.0,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          /*
                        _authService
                            .signIn(
                                emailControler.text, passwordControler.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                        */
                        },
                        child: Text(
                          "Giris yap",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}

Widget _emailField() {
  return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "Email",
          prefixIcon: Icon(
            Icons.mail,
            color: Color.fromARGB(255, 58, 56, 56),
          )));
}

Widget _passwordField() {
  return TextFormField(
    autofocus: false,
    obscureText: true,
    validator: (value) => null,
    textInputAction: TextInputAction.done,
    decoration: InputDecoration(
        hintText: "Sifre",
        prefixIcon: Icon(
          Icons.lock,
          color: Color.fromARGB(255, 58, 56, 56),
        )),
  );
}

Widget _submitionButton() {
  return RawMaterialButton(
    fillColor: Color.fromARGB(255, 58, 56, 56),
    elevation: 0.0,
    padding: EdgeInsets.symmetric(vertical: 20.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onPressed: () {
      /*
                        _authService
                            .signIn(
                                emailControler.text, passwordControler.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                        */
    },
    child: Text(
      "Giris yap",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    ),
  );
}
