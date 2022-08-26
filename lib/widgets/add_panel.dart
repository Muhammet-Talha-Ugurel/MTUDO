import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'new_panel.dart';

Widget AddPanel(BuildContext context) {
  return FloatingActionButton(
      backgroundColor: Color.fromARGB(115, 90, 89, 89),
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => NewPanel(context));
      });
}
