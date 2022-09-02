import 'package:mtudo/models/ModelProvider.dart';
import 'package:mtudo/models/PanelRow.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class PanelRowRepository {
  Future<List<PanelRow>> getPanelRows(Panel panel) {
    return Amplify.DataStore.query(PanelRow.classType,
        where: PanelRow.PANELID.eq(panel.id));
  }

  Future<void> createPanelRow(
      String name, String description, String userId) async {
    final newPanel =
        Panel(name: name, description: description, userID: userId);
    try {
      await Amplify.DataStore.save(newPanel);
    } catch (e) {
      throw e;
    }
  }

/*
  Future<PanelRow> getPanelRows(String id) async {
    final panelRows = await Amplify.DataStore.query(PanelRow.classType,
        where: PanelRow.ID.eq(id));
    return panelRows.first;
  }
*/
}
