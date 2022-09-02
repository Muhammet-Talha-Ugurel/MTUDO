part of 'panel_row_bloc.dart';

@immutable
class PanelRowState {
  final String name;
  bool get isValidName => name.length > 3;

  final FormSubmissionStatus formStatus;

  PanelRowState({
    this.name = '',
    this.formStatus = const InitialFormStatus(),
  });

  PanelRowState copyWith({
    String? name,
    FormSubmissionStatus? formStatus,
  }) {
    return PanelRowState(
      name: name ?? this.name,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoadingPanelRowState extends PanelRowState {}

class LoadedPanelRowState extends PanelRowState {
  List<PanelRow> panelsRow;
  LoadedPanelRowState({required this.panelsRow});
}

class FaildToLoadPanelRowState extends PanelRowState {
  Error error;
  FaildToLoadPanelRowState({required this.error});
}

class UpdateingPanelRowState extends PanelRowState {}

class UpdatedPanelRowState extends PanelRowState {
  List<PanelRow> panelRows;
  UpdatedPanelRowState({required this.panelRows});
}

class FaildToUpdatePanelRowState extends PanelRowState {
  Error error;
  FaildToUpdatePanelRowState({required this.error});
}

class DeletingPanelRowState extends PanelRowState {}

class DeletedPanelRowState extends PanelRowState {
  List<PanelRow> panelRows;
  DeletedPanelRowState({required this.panelRows});
}

class FaildToDeletePanelRowState extends PanelRowState {
  Error error;
  FaildToDeletePanelRowState({required this.error});
}

class ObserveingPanelRowState extends PanelRowState {}

class ObservedPanelRowState extends PanelRowState {
  List<PanelRow> panelRows;
  ObservedPanelRowState({required this.panelRows});
}

class FaildToObservePanelRowState extends PanelRowState {
  Error error;
  FaildToObservePanelRowState({required this.error});
}

class CretaingPanelRowState extends PanelRowState {}

class CreatedPanelRowState extends PanelRowState {}

class FaildToCreatePanelRowState extends PanelRowState {
  Error error;
  FaildToCreatePanelRowState({required this.error});
}
