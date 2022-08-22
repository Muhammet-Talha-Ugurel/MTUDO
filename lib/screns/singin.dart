import 'package:flutter/material.dart';
import '../auth/login/login.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameControler = new TextEditingController();
  final TextEditingController secondNameControler = new TextEditingController();
  final TextEditingController emailControler = new TextEditingController();
  final TextEditingController passwordControler = new TextEditingController();
  final TextEditingController confrimPasswordControler =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstNameControler,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        firstNameControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "First Name",
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 58, 56, 56),
          )),
    );
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameControler,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        secondNameControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "Last Name",
          prefixIcon: Icon(
            Icons.person,
            color: Color.fromARGB(255, 58, 56, 56),
          )),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailControler,
      keyboardType: TextInputType.emailAddress,
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
      controller: passwordControler,
      obscureText: true,
      onSaved: (value) {
        emailControler.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromARGB(255, 58, 56, 56),
          )),
    );
    final confrimPasswordField = TextFormField(
      autofocus: false,
      controller: confrimPasswordControler,
      obscureText: true,
      onSaved: (value) {
        emailControler.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Confirm Password",
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
                  children: [
                    const SizedBox(
                      height: 11.0,
                    ),
                    const Text(
                      'Sing In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 161, 0, 0),
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 22.0,
                    ),
                    firstnameField,
                    const SizedBox(
                      height: 22.0,
                    ),
                    secondNameField,
                    const SizedBox(
                      height: 22.0,
                    ),
                    emailField,
                    const SizedBox(
                      height: 22.0,
                    ),
                    passwordField,
                    const SizedBox(
                      height: 22.0,
                    ),
                    confrimPasswordField,
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already sing in? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login",
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
                        onPressed: () {},
                        child: Text(
                          "Sing In",
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
