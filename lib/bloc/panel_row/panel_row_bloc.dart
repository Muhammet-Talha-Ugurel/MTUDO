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
    on<ObservePanelRowEvent>(_onObservePanelRowEvent);
    on<PanelRowSubmitted>(_onPanelRowSubmitted);
    on<PanelRowNameChanged>(_onPanelRowNameChanged);
  }

  void _onLoadPanelRowEvent(
      LoadPanelRowEvent event, Emitter<PanelRowState> emit) async {
    emit(LoadingPanelRowState());
    try {
      final panelRows = await _panelRowRepo.getPanelRows(event.panel);
      emit(LoadedPanelRowState(panelRows: panelRows));
    } catch (e) {
      emit(FaildToLoadPanelRowState(error: e as Error));
    }
  }

  void _onPanelRowNameChanged(
      PanelRowNameChanged event, Emitter<PanelRowState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPanelRowSubmitted(
      PanelRowSubmitted event, Emitter<PanelRowState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await _panelRowRepo.createPanelRow(state.name);
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }

  void _onObservePanelRowEvent(
      ObservePanelRowEvent event, Emitter<PanelRowState> emit) async {
    emit(ObserveingPanelRowState());
    try {} catch (e) {
      emit(FaildToObservePanelRowState(error: e as Error));
    }
  }
}
