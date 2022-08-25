import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPanel extends StatelessWidget {
  const AddPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Color.fromARGB(115, 90, 89, 89),
        child: Icon(
          Icons.add,
        ),
        onPressed: () {});
  }
}
