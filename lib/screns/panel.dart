import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mtudo/bloc/panel/panel_bloc.dart';
import 'package:mtudo/bloc/panel/panel_event.dart';
import 'package:mtudo/models/Panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/panel/panel_state.dart';

class PanelScreen extends StatelessWidget {
  Panel panel;
  PanelScreen(this.panel);
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PanelBloc()..add(LoadPanelEvent()),
      child: BlocBuilder<PanelBloc, PanelState>(
        builder: (context, state) {
          if (state is LoadedPanelState) {
            return Scaffold(
              body: Center(child: Text(panel.name!)),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
