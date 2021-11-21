import 'package:flutter/material.dart';

import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:studentessentials/result/widgets/piechart.dart';
import 'package:studentessentials/result/widgets/result_utils.dart';

class ResultDetails extends StatelessWidget {
  final ResultListModel results;
  const ResultDetails({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = results.results;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Result'),
      ),
      body: ListView(
        children: [
          PieChartResult(
            pieData: result,
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: result.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(calculateGradeFromCGPA(result[index].grade)),
                    radius: 20,
                  ),
                  title: Text(result[index].courseName),
                  subtitle: Text(
                      'credit : ${result[index].credit}, grade :${result[index].grade} '),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
