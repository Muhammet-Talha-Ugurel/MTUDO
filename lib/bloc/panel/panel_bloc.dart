import 'package:mtudo/services/auth_repository.dart';
import '../../services/panel_repository.dart';
import '../auth/form_submition_status.dart';
import 'panel_event.dart';
import 'panel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanelBloc extends Bloc<PanelEvent, PanelState> {
  final _panelRepo = PanelRepository();
  final _auth_Repo = AuthRepository();

  PanelBloc() : super(LoadingPanelState()) {
    on<LoadPanelEvent>(_onLoadPanelEvent);
    on<ObservePanelEvent>(_onObservePanelEvent);
    on<PanelSubmitted>(_onPanelSubmitted);
    on<PanelNameChanged>(_onPanelNameChanged);
  }
  void _onLoadPanelEvent(LoadPanelEvent event, Emitter<PanelState> emit) async {
    emit(LoadingPanelState());
    try {
      final user = await _auth_Repo.getCurrentUser();
      final panels = await _panelRepo.getPanels(user);
      emit(LoadedPanelState(panels: panels));
    } catch (e) {
      emit(FaildToLoadPanelState(error: e as Error));
    }
  }

  void _onPanelNameChanged(PanelNameChanged event, Emitter<PanelState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPanelSubmitted(PanelSubmitted event, Emitter<PanelState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      final user = await _auth_Repo.getCurrentUser();
      await _panelRepo.createPanel(state.name, '', user.userId);
      LoadPanelEvent();
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e as Exception)));
    }
  }

  void _onObservePanelEvent(
      ObservePanelEvent event, Emitter<PanelState> emit) async {
    emit(ObserveingPanelState());
    try {
      LoadPanelEvent();
    } catch (e) {
      emit(FaildToObservePanelState(error: e as Error));
    }
  }
}
