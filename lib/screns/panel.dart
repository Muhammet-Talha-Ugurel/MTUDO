import 'package:flutter/material.dart';
import 'package:mtudo/models/Panel.dart';

class PanelScreen extends StatelessWidget {
  Panel panel;
  PanelScreen(this.panel);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(panel.name!)),
    );
  }
}
