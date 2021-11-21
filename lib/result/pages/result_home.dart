import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/hooks/box_hook.dart';
import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:studentessentials/result/pages/new_result.dart';
import 'package:studentessentials/routes/routes.gr.dart';

class ResultHomePage extends HookWidget {
  const ResultHomePage({Key? key}) : super(key: key);
  static const routeName = 'add-results';

  @override
  Widget build(BuildContext context) {
    debugPrint("calling build...");

    final resultBoxs = useBox<ResultModel>(Constant.kBOXResult);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Result Calculator'),
          actions: <Widget>[
            IconButton(
                disabledColor: Colors.black26,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                onPressed: resultBoxs == null
                    ? null
                    : () {
                        context.router.push(
                          UserFormScreenRoute(
                            finalcpga: calculateResultfromBox(resultBoxs),
                          ),
                        );
                      }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
                context: context, builder: (_) => const NewResultInput());
          },
          child: const Icon(Icons.add),
        ),
        body: resultBoxs == null
            ? const CircularProgressIndicator()
            : buildListtile(context));
  }
}

double calculateResultfromBox(Box<ResultModel> box) {
  final totalscore = box.values
      .map((res) => res.credit * res.grade)
      .toList()
      .fold(0.0, (double pre, next) => pre + next);
  final totalcredit = box.values
      .map((res) => res.credit)
      .toList()
      .fold(0.0, (double prev, ele) => prev + ele);
  return totalscore / totalcredit;
}

Widget buildListtile(
  context,
) {
  return ValueListenableBuilder(
    valueListenable: Hive.box<ResultModel>(Constant.kBOXResult).listenable(),
    builder: (BuildContext context, Box<ResultModel> value, Widget? child) {
      return Column(
        children: <Widget>[
          Card(
            elevation: 5.0,
            color: Colors.pink,
            margin: const EdgeInsets.all(10),
            child: getResult(
              value,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index) {
                final resultcard = value.values.toList();
                return ListTile(
                  title: Text(resultcard[index].courseName),
                  subtitle: Text(resultcard[index].credit.toString()),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await value.deleteAt(index);
                    },
                  ),
                  leading: CircleAvatar(
                    child: Text(resultcard[index].grade.toString()),
                    radius: 30,
                  ),
                );
              },
            ),
          )
        ],
      );
    },
  );
}

Widget getResult(
  Box<ResultModel> box,
) {
  final totalscore = box.values
      .map((res) => res.credit * res.grade)
      .toList()
      .fold(0.0, (double pre, next) => pre + next);
  final totalcredit = box.values
      .map((res) => res.credit)
      .toList()
      .fold(0.0, (double prev, ele) => prev + ele);
  final result = totalscore / totalcredit;

  return SizedBox(
    width: double.infinity,
    child: Column(
      children: <Widget>[
        Text(
          result.isNaN
              ? 'No result'
              : "Your CGPA - ${result.toStringAsFixed(2)}",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          result.isNaN
              ? 'No credit'
              : "Total credit - ${totalcredit.toStringAsFixed(2)}",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ),
  );
}
