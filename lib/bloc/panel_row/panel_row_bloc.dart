import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'panel_row_event.dart';
part 'panel_row_state.dart';

class PanelRowBloc extends Bloc<PanelRowEvent, PanelRowState> {
  PanelRowBloc() : super(PanelRowInitial()) {
    on<PanelRowEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
