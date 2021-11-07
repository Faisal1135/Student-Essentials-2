import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentessentials/constant.dart';
import 'package:studentessentials/result/model/resultmodel.dart';

import 'package:uuid/uuid.dart';

Map<String, double> cgpaFinder = {
  'A+': 4.00,
  'A': 3.75,
  'A-': 3.50,
  'B+': 3.25,
  'B': 3.00,
  'B-': 2.75,
  'C': 2.50,
  'D': 2.25,
};

class NewResultInput extends StatefulWidget {
  const NewResultInput({Key? key}) : super(key: key);

  @override
  _NewResultInputState createState() => _NewResultInputState();
}

class _NewResultInputState extends State<NewResultInput> {
  late TextEditingController courseInputController;
  late TextEditingController creditInputController;
  @override
  void initState() {
    super.initState();
    courseInputController = TextEditingController();
    creditInputController = TextEditingController();
  }

  double selectedCGPA = 4.0;

  List<DropdownMenuItem<double>> getDropdownmenuGPA() {
    List<DropdownMenuItem<double>> dropdownitems = [];
    cgpaFinder.forEach((k, v) {
      DropdownMenuItem<double> dropdown = DropdownMenuItem(
        child: Text(k),
        value: v.toDouble(),
      );
      dropdownitems.add(dropdown);
    });
    return dropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Course Title'),
            controller: courseInputController,
            keyboardType: TextInputType.text,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Credit'),
            controller: creditInputController,
            keyboardType: TextInputType.number,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  'CHOOSE GRADE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.pink),
                ),
                DropdownButton(
                  value: selectedCGPA,
                  items: getDropdownmenuGPA(),
                  onChanged: (double? grade) {
                    setState(() {
                      selectedCGPA = grade!;
                    });
                  },
                  style: const TextStyle(
                      color: Colors.purpleAccent, fontSize: 20.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onPressed: () => Navigator.of(context).pop()),
              TextButton(
                onPressed: () async {
                  ResultModel resultcard = ResultModel(
                      id: const Uuid().v4(),
                      courseName: courseInputController.text,
                      credit: double.parse(creditInputController.text),
                      grade: selectedCGPA);

                  await Hive.box<ResultModel>(Constant.kBOXResult)
                      .add(resultcard);
                },
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.add),
                    Text("Add result to the Card",
                        style: TextStyle(color: Colors.green))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
