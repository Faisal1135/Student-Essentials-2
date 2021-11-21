import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentessentials/notes/models/note_model.dart';
import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:studentessentials/routes/routes.gr.dart';
import 'package:studentessentials/skechpad/skechpad.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    AsyncInitLoader(),
  );
}

class AsyncInitLoader extends HookWidget {
  static Future<void> asyncLoader() async {
    await Firebase.initializeApp();
    await Hive.initFlutter();
    registerBoxs();
  }

  static void registerBoxs() {
    Hive.registerAdapter<ResultListModel>(ResultListModelAdapter());
    Hive.registerAdapter<Owner>(OwnerAdapter());
    Hive.registerAdapter<ResultModel>(ResultModelAdapter());
    Hive.registerAdapter<ColoredPath>(ColoredPathAdapter());
    Hive.registerAdapter<NoteModel>(NoteModelAdapter());
    Hive.registerAdapter<NoteTag>(NoteTagAdapter());
  }

  AsyncInitLoader({Key? key}) : super(key: key);
  final Future<void> _initialization = asyncLoader();
  @override
  Widget build(BuildContext context) {
    final _fireinit = useFuture(_initialization);

    if (_fireinit.connectionState == ConnectionState.waiting) {
      return const MaterialApp(
        home: Scaffold(
          body: Text('loading...'),
        ),
      );
    }

    if (_fireinit.hasError) {
      return MaterialApp(
        home: Scaffold(body: Text('Something went wrong ${_fireinit.error}')),
      );
    }
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();
    return MaterialApp.router(
      title: "Student Essentials",
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
