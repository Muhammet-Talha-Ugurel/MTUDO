import 'package:flutter/material.dart';
import 'package:mtudo/bloc/panel/panel_bloc.dart';
import 'package:mtudo/bloc/panel/panel_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/panel/panel_state.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Widget NewPanel(BuildContext context) {
  return BlocProvider(
    create: (context) => PanelBloc(),
    child: BlocBuilder<PanelBloc, PanelState>(
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                autofocus: false,
                validator: (value) =>
                    state.isValidName ? null : 'Username is too short',
                decoration: InputDecoration(hintText: 'Enter todo title'),
                onChanged: (value) => context
                    .read<PanelBloc>()
                    .add(PanelNameChanged(name: value)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<PanelBloc>().add(PanelSubmitted());
                  }
                },
                child: Text('Save Todo'))
          ],
        );
      },
    ),
  );
}
