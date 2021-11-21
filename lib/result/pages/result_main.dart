import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/hooks/box_hook.dart';
import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:studentessentials/result/widgets/result_utils.dart';
import 'package:studentessentials/routes/routes.gr.dart';

class ResultMainPage extends HookWidget {
  const ResultMainPage({Key? key}) : super(key: key);
  static const routeName = "resultmainpage";

  @override
  Widget build(BuildContext context) {
    final restultlistBox =
        useBox<ResultListModel>(Constant.kBOXResulListtModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User list'),
      ),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              context.router.push(const ResultHomePageRoute());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.amber, width: 6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.add,
                    ),
                    SizedBox(width: 10),
                    Text("Add Result"),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          ),
          restultlistBox == null
              ? const CircularProgressIndicator()
              : buildResultList(restultlistBox),
        ],
      ),
    );
  }

  Widget buildResultList(Box<ResultListModel> resultsbox) {
    return ValueListenableBuilder(
      valueListenable: resultsbox.listenable(),
      builder:
          (BuildContext context, Box<ResultListModel> value, Widget? child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: value.length,
          itemBuilder: (BuildContext context, int index) {
            final result = value.getAt(index) ?? ResultListModel.init();
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                child: result.cgpa == '0'
                    ? const FittedBox(
                        child: Text('No CGPA'),
                      )
                    : FittedBox(
                        child: Text(
                          calculateGradeFromCGPA(
                            double.tryParse(result.cgpa) ?? 0,
                          ),
                        ),
                      ),
                radius: 30,
              ),
              title: Text(result.username),
              subtitle: Text(result.cgpa),
              onTap: () {
                context.router.push(ResultDetailsRoute(results: result));
                // Navigator.of(context)
                //     .pushNamed(ResultofUserScreen.routeName, arguments: result);
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await resultsbox.deleteAt(index);
                },
              ),
            );
          },
        );
      },
    );
  }
}
