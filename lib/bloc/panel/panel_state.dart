import '../../models/Panel.dart';
import '../auth/form_submition_status.dart';

class PanelState {
  final String name;
  bool get isValidName => name.length > 3;

  final FormSubmissionStatus formStatus;

  PanelState({
    this.name = '',
    this.formStatus = const InitialFormStatus(),
  });

  PanelState copyWith({
    String? name,
    FormSubmissionStatus? formStatus,
  }) {
    return PanelState(
      name: name ?? this.name,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

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

class CretaingPanelState extends PanelState {}

class CreatedPanelState extends PanelState {}

class FaildToCreatePanelState extends PanelState {
  Error error;
  FaildToCreatePanelState({required this.error});
}

class ShowingPanelDetailState extends PanelState {}

class ShowPanelDetailState extends PanelState {
  Panel panel;
  ShowPanelDetailState({required this.panel});
}
