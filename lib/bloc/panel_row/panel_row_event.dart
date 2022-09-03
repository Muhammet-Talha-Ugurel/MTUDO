part of 'panel_row_bloc.dart';

@immutable
abstract class PanelRowEvent {}

class LoadPanelRowEvent extends PanelRowEvent {
  final Panel panel;
  LoadPanelRowEvent(this.panel);
}

class UpdatePanelRowEvent extends PanelRowEvent {}

class DeltePanelRowEvent extends PanelRowEvent {}

class ObservePanelRowEvent extends PanelRowEvent {}

// ---- For Creating new Panel Row ------//

class PanelRowNameChanged extends PanelRowEvent {
  final String name;

  PanelRowNameChanged({required this.name});
}

class PanelRowSubmitted extends PanelRowEvent {}
