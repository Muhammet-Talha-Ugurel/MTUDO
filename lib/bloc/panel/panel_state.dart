import '../../models/Panel.dart';

abstract class PanelState {}

class LoadingPanelState extends PanelState {}

class LoadedPanelState extends PanelState {
  List<Panel> panels;
  LoadedPanelState({required this.panels});
}

class FaildToLoadPanelState extends PanelState {
  Error error;
  FaildToLoadPanelState({required this.error});
}

class UpdateingPanelState extends PanelState {}

class UpdatedPanelState extends PanelState {
  List<Panel> panels;
  UpdatedPanelState({required this.panels});
}

class FaildToUpdatePanelState extends PanelState {
  Error error;
  FaildToUpdatePanelState({required this.error});
}

class DeletingPanelState extends PanelState {}

class DeletedPanelState extends PanelState {
  List<Panel> panels;
  DeletedPanelState({required this.panels});
}

class FaildToDeletePanelState extends PanelState {
  Error error;
  FaildToDeletePanelState({required this.error});
}

class ObserveingPanelState extends PanelState {}

class ObservedPanelState extends PanelState {
  List<Panel> panels;
  ObservedPanelState({required this.panels});
}

class FaildToObservePanelState extends PanelState {
  Error error;
  FaildToObservePanelState({required this.error});
}
