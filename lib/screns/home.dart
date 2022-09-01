import 'package:flutter/material.dart';
import 'package:mtudo/bloc/panel/panel_event.dart';
import 'package:mtudo/bloc/panel/panel_state.dart';
import 'package:mtudo/screns/panel.dart';
import 'package:mtudo/widgets/add_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/panel/panel_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanelBloc, PanelState>(builder: (context, state) {
      if (state is LoadingPanelState) {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: AddPanel(context),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  Text("Data is Loading!!")
                ]),
          ),
        );
      } else if (state is LoadedPanelState) {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: AddPanel(context),
          body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: state.panels.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => {
                context.read<PanelBloc>()
                  ..add(ShowPanelDetailEvent(state.panels[index])),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<PanelBloc>(context),
                          child: PanelScreen(),
                        ))),
              },
              child: Card(
                elevation: 20,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      state.panels[index].name!,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                )),
              ),
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: AddPanel(context),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
