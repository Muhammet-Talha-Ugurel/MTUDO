import 'package:flutter/material.dart';
import 'package:mtudo/bloc/auth/login/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/1.jpg"), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Welcome To The",
                style: TextStyle(
                    color: Color.fromARGB(255, 161, 0, 0),
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "MTUDO",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            TextButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                    },
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 163, 16, 5)),
                ))
          ],
        ),
      ),
    ));
  }
}
