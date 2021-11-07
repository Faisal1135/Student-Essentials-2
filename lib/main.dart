import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:studentessentials/result/pages/result_home.dart';
import 'package:studentessentials/result/pages/result_main.dart';
import 'package:studentessentials/result/pages/save_user.dart';

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
  }

  AsyncInitLoader({Key? key}) : super(key: key);
  final Future<void> _initialization = asyncLoader();
  @override
  Widget build(BuildContext context) {
    final _fireinit = useFuture(_initialization);

    if (_fireinit.connectionState == ConnectionState.waiting) {
      return const HomePage(
        body: Scaffold(body: Text('loading...')),
      );
    }

    if (_fireinit.hasError) {
      return HomePage(
        body: Scaffold(body: Text('Something went wrong ${_fireinit.error}')),
      );
    }
    return const HomePage(
      title: "Result App",
      body: ResultMainPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget body;
  final String title;
  const HomePage({Key? key, required this.body, this.title = "Your Title"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: body,
      routes: {
        ResultHomePage.routeName: (context) => const ResultHomePage(),
        UserFormScreen.routeName: (context) => const UserFormScreen(),
      },
    );
  }
}
