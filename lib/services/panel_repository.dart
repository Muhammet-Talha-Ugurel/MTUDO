import 'package:mtudo/models/ModelProvider.dart';
import 'package:mtudo/models/Panel.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class PanelRepository {
  Future<List<Panel>> getPanels(AuthUser user) {
    return Amplify.DataStore.query(Panel.classType,
        where: Panel.USERID.eq(user.userId));
  }

  Future<void> createPanel(
      String name, String description, String userId) async {
    final newPanel =
        Panel(name: name, description: description, userID: userId);
    try {
      await Amplify.DataStore.save(newPanel);
    } catch (e) {
      throw e;
    }
  }
}
