import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mtudo/bloc/panel/panel_bloc.dart';
import 'package:mtudo/bloc/panel/panel_event.dart';
import 'package:mtudo/models/Panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/panel/panel_state.dart';

class PanelScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<PanelBloc, PanelState>(
      builder: (blocContext, state) {
        if (state is ShowPanelDetailState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.panel.name!),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PanelRow(
                      title: 'ToDo',
                      todos: Todo(text: 'test'),
                    ),
                    PanelRow(
                      title: 'On Proses',
                      todos: Todo(text: 'test'),
                    ),
                    PanelRow(
                      title: 'Done',
                      todos: Todo(text: 'test'),
                    ),
                    Container(
                      height: 50,
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Row(
                          children: [
                            Icon(Icons.add),
                            Text('Add Row'),
                          ],
                        )),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class PanelRow extends StatelessWidget {
  final String title;
  final Todo todos;
  const PanelRow({super.key, required this.title, required this.todos});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Card(
          child: Column(
        children: [
          Container(
              height: 50,
              width: 100,
              child: Card(
                  elevation: 30,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ))),
          todos,
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              'Add Todo +',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(255, 182, 0, 0)),
            ),
          )
        ],
      )),
    );
  }
}

class Todo extends StatelessWidget {
  final String text;
  const Todo({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Card(
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.justify,
        )),
      ),
    );
  }
}
