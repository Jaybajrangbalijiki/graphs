/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'management_dto.dart';

class MonthPurchaseChart extends StatelessWidget {
  final bool animate = false;
  List<MonthPurchase>? monthPurchase;

  MonthPurchaseChart(this.monthPurchase, {super.key});

  // variable,argument,parameter,instance

  /// Create one series with sample hard coded data.
  List<charts.Series<MonthPurchase?, String>> _createSampleData() {
    return [
      charts.Series<MonthPurchase, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (MonthPurchase sales, _) => (sales.monthDisp).substring(0, 3),
        // domainFn: (MonthPurchase sales, _) => (sales.monthDisp),
        measureFn: (MonthPurchase sales, _) => int.parse(sales.monthCount),
        // measureFn: (MonthPurchase sales, _) => NumberFormat.compact().format(numberToFormat),
        data: monthPurchase!,
        labelAccessorFn: (MonthPurchase row, _) => '${row.monthCount}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final valueFormatter =
    charts.BasicNumericTickFormatterSpec.fromNumberFormat(
        NumberFormat.compact());
    return charts.BarChart(
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickFormatterSpec: valueFormatter,
            tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                desiredMinTickCount: 5)),
        _createSampleData(),
        animate: animate,
        defaultRenderer: new charts.BarRendererConfig(
            barRendererDecorator: new charts.BarLabelDecorator(
                labelPosition: charts.BarLabelPosition.outside)));
  }
}
