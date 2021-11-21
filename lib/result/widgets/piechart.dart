import 'package:flutter/material.dart';
import 'package:studentessentials/result/model/resultmodel.dart';
import 'package:uuid/uuid.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartResult extends StatelessWidget {
  final List<ResultModel> pieData;
  const PieChartResult({Key? key, required this.pieData}) : super(key: key);

  List<charts.Series<ResultModel, String>> _genarateChart() {
    List<charts.Series<ResultModel, String>> _seriesData = [];

    _seriesData.add(
      charts.Series(
          data: pieData,
          domainFn: (ResultModel res, _) => res.courseName,
          measureFn: (ResultModel res, _) => res.credit * res.grade,
          id: const Uuid().v4(),
          labelAccessorFn: (ResultModel res, _) =>
              "${res.courseName} \n ${res.grade * res.credit}"),
    );
    return _seriesData;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: charts.PieChart<String>(
        _genarateChart(),
        animate: true,
        animationDuration: const Duration(milliseconds: 1400),
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 100,
            arcRendererDecorators: [
              charts.ArcLabelDecorator(
                  labelPosition: charts.ArcLabelPosition.inside)
            ]),
      ),
    );
  }
}
