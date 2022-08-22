import 'package:flutter/material.dart';
import 'package:mtudo/models/ModelProvider.dart';
import 'package:mtudo/screns/loadingview.dart';
import 'package:mtudo/screns/todo_view.dart';
import 'package:mtudo/services/todo_cubit.dart';
import '/screns/theme.dart';
import '/screns/wellcome.dart';
import 'amplifyconfiguration.dart';
// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // await Amplify.addPlugin(AmplifyAPI()); // UNCOMMENT this line after backend is deployed
    await Amplify.addPlugin(
        AmplifyDataStore(modelProvider: ModelProvider.instance));
    await Amplify.addPlugin(AmplifyAPI());
    await Amplify.addPlugin(AmplifyAuthCognito());

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MTUDO',
      home: BlocProvider(
          create: (context) => TodoCubit()
            ..getTodos()
            ..observeTodo(),
          child: _amplifyConfigured ? TodosView() : LoadingView()),
      theme: darkThemeData(context),
      darkTheme: darkThemeData(context),
    );
  }
}
