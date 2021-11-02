import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const HomePage(
      body: Text('bk'),
    ),
  );
}

class HomePage extends StatelessWidget {
  final Widget body;
  const HomePage({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase init'),
        ),
        body: body,
      ),
    );
  }
}
