/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'management_dto.dart';

class MonthIssuanceChart extends StatelessWidget {
  final bool animate = false;
  List<MonthIssuance>? monthIssuance;

  MonthIssuanceChart(List<MonthIssuance> monthIssuance) {
    this.monthIssuance = monthIssuance;
  }

  // variable,argument,parameter,instance

  /// Create one series with sample hard coded data.
  List<charts.Series<MonthIssuance?, String>> _createSampleData() {
    return [
      charts.Series<MonthIssuance, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (MonthIssuance sales, _) => (sales.monthDisp).substring(0, 3),
        measureFn: (MonthIssuance sales, _) => int.parse(sales.monthCount),
        data: monthIssuance!,
        labelAccessorFn: (MonthIssuance row, _) => '${row.monthCount}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      primaryMeasureAxis: new charts.NumericAxisSpec(tickProviderSpec:
      new charts.BasicNumericTickProviderSpec(desiredMinTickCount: 2)),
      _createSampleData(),
      animate: animate,
        defaultRenderer: new charts.BarRendererConfig(
            barRendererDecorator:
              new charts.BarLabelDecorator(
                  labelPosition: charts.BarLabelPosition.outside)
            )
    );
  }
}

