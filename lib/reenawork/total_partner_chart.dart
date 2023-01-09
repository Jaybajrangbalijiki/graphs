/// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:reenawork/reenawork/management_dto.dart';

class TotalPartnerChart extends StatelessWidget {
  final bool animate = true;
  List<TotalPartners> totalPartners;

  TotalPartnerChart(List<TotalPartners> this.totalPartners);

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<String>(
      _createSampleData(),
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
          arcRendererDecorators: [
        new charts.ArcLabelDecorator(
        labelPosition: charts.ArcLabelPosition.outside)
    ]),
      behaviors: [
        new charts.DatumLegend(
          horizontalFirst: false,
          showMeasures: false,
          position: charts.BehaviorPosition.bottom,
          desiredMaxRows: 2,
          desiredMaxColumns: 2,
          outsideJustification: charts.OutsideJustification.startDrawArea,
        )],
    );
  }

  List<charts.Series<PieData, String>> _createSampleData() {
    final data = [
      PieData("Total Channel Partner", int.parse(totalPartners[0].totalRa),charts.MaterialPalette.blue.shadeDefault),
      PieData("Total Business Partner", int.parse(totalPartners[0].totalBp),charts.MaterialPalette.green.shadeDefault),
      PieData("Total Branch Users", int.parse(totalPartners[0].totalBr),charts.MaterialPalette.deepOrange.shadeDefault),
    ];
    return [
      charts.Series<PieData, String>(
        id: 'PieData',
        domainFn: (PieData sales, _) => sales.key,
        measureFn: (PieData sales, _) => sales.value,
        colorFn:(PieData sales, _) => sales.color,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (PieData row, _) => '${row.value}',
      )
    ];
  }
}

class PieData {
  final String key;
  final int value;
  final charts.Color color;
  PieData(this.key, this.value,this.color);
}
