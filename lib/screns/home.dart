import 'package:flutter/material.dart';
import 'package:mtudo/widgets/add_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: AddPanel(),
      body: Column(
        children: [
          Card(
            elevation: 10,
            child: Container(
                height: 100,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Add New Panel',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
