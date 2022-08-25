import 'package:mtudo/models/ModelProvider.dart';
import 'package:mtudo/models/Panel.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class PanelRepository {
  Future<List<Panel>> getPanels(User userId) {
    return Amplify.DataStore.query(Panel.classType,
        where: Panel.USERID.eq(userId));
  }

  Future<void> createPanel(
      String name, String description, String userId, String panelrowId) async {
    final newPanel =
        Panel(name: name, description: description, userID: userId);
    try {
      await Amplify.DataStore.save(newPanel);
    } catch (e) {
      throw e;
    }
  }
}
