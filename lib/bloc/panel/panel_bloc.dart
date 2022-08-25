import '../../services/panel_repository.dart';
import 'panel_event.dart';
import 'panel_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanelBloc extends Bloc<PanelEvent, PanelState> {
  final _panelRepo = PanelRepository();
  PanelBloc() : super(LoadingPanelState()) {}
}
