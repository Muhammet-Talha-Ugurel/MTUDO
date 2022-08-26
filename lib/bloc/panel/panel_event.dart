abstract class PanelEvent {}

class LoadPanelEvent extends PanelEvent {}

class UpdatePanelEvent extends PanelEvent {}

class DeltePanelEvent extends PanelEvent {}

class ObservePanelEvent extends PanelEvent {}

class PanelNameChanged extends PanelEvent {
  final String name;

  PanelNameChanged({required this.name});
}

class PanelSubmitted extends PanelEvent {}
