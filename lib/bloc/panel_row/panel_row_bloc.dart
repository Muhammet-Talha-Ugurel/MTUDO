import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mtudo/models/ModelProvider.dart';
import 'package:mtudo/services/panel_row_repository.dart';

import '../auth/form_submition_status.dart';

part 'panel_row_event.dart';
part 'panel_row_state.dart';

class PanelRowBloc extends Bloc<PanelRowEvent, PanelRowState> {
  final _panelRowRepo = PanelRowRepository();

  PanelRowBloc() : super(LoadingPanelRowState()) {
    on<LoadPanelRowEvent>((_onLoadPanelRowEvent));
  }

  void _onLoadPanelRowEvent(
      LoadPanelRowEvent event, Emitter<PanelRowState> emit) async {
    emit(LoadingPanelRowState());
    try {} catch (e) {
      emit(FaildToLoadPanelRowState(error: e as Error));
    }
  }
}
