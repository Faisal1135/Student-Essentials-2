import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/hooks/box_hook.dart';
import 'package:studentessentials/result/model/resultmodel.dart';

class UserFormScreen extends HookWidget {
  static const routeName = '/user-form-page';

  const UserFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final finalcpga = ModalRoute.of(context)?.settings.arguments as double;
    debugPrint(finalcpga.toString());
    final usrTextEcontrol = useTextEditingController();
    final resultbox = useBox<ResultModel>(Constant.kBOXResult);
    final resultlistbox = useBox<ResultListModel>(Constant.kBOXResulListtModel);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User input form'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration:
                      const InputDecoration(labelText: "Enter Your userName"),
                  controller: usrTextEcontrol,
                  keyboardType: TextInputType.text,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: resultbox == null || resultlistbox == null
                  ? null
                  : () async {
                      final resultlistmodel = ResultListModel.init().copyWith(
                          results: resultbox.values.toList(),
                          cgpa: finalcpga.toStringAsFixed(2),
                          username: usrTextEcontrol.text);
                      await resultlistbox.add(resultlistmodel);
                      await resultbox.clear();

                      // Navigator.pushAndRemoveUntil(context, r, (route) => rou)

                      // final resultsbox = Hive.box<Results>(kresultsBox);
                      // final newResults = Results(
                      //     id: studentId.text,
                      //     results: Hive.box<ResultModel>(kresultBox).values.toList(),
                      //     username: usrTextEcontrol.text,
                      //     cgpa: finalcpga.toStringAsFixed(2));
                      // await resultsbox.add(newResults);
                      // await Hive.box<ResultModel>(kresultBox).clear();
                      // Navigator.of(context).pushNamed(UserResultScreen.routeName);
                    },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

//  final finalcpga = ModalRoute.of(context).settings.arguments as double;
//     final GlobalKey<FormBuilderState> _fbkey = GlobalKey<FormBuilderState>();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User input form'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: <Widget>[
//             FormBuilder(
//               key: _fbkey,
//               child: Column(
//                 children: <Widget>[
//                   FormBuilderTextField(
//                     attribute: 'username',
//                     decoration:
//                         InputDecoration(labelText: "Enter your username"),
//                     validators: [FormBuilderValidators.required()],
//                     keyboardType: TextInputType.text,
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   FormBuilderTextField(
//                     attribute: 'student_id',
//                     decoration:
//                         InputDecoration(labelText: "Enter your student id"),
//                     validators: [
//                       FormBuilderValidators.required(),
//                     ],
//                     keyboardType: TextInputType.number,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             RaisedButton(
//               onPressed: () async {
//                 if (_fbkey.currentState.validate()) {
//                   _fbkey.currentState.save();
//                   final formData = _fbkey.currentState.value;
//                   print(formData);
//                   final resultsbox = Hive.box<Results>(kresultsBox);
//                   final newResults = Results(
//                       id: formData["student_id"],
//                       results:
//                           Hive.box<ResultModel>(kresultBox).values.toList(),
//                       username: formData["username"],
//                       cgpa: finalcpga.toStringAsFixed(2));
//                   await resultsbox.add(newResults);
//                   await Hive.box<ResultModel>(kresultBox).clear();
//                   Navigator.of(context).pushNamed(UserResultScreen.routeName);
//                 }
//               },
//               child: Text("Submit"),
//             )
//           ],
//         ),
//       ),
//     );
