/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RegVSAppChart extends StatelessWidget {
  final bool animate = false;
  List<String> monthArrRegVsApp;
  List<String> monthCountArrRegVsApp1;
  List<String> monthCountArrRegVsApp2;

  RegVSAppChart(this.monthArrRegVsApp, this.monthCountArrRegVsApp1,
      this.monthCountArrRegVsApp2,
      {super.key});

  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final List<OrdinalSales> dataOne = [];
    final List<OrdinalSales> dataTwo = [];
    for (var i = 0; i < monthArrRegVsApp.length; i++) {
      dataOne.add(OrdinalSales(
          monthArrRegVsApp[i], int.parse(monthCountArrRegVsApp1[i]),charts.MaterialPalette.indigo.shadeDefault));
      dataTwo.add(OrdinalSales(monthArrRegVsApp[i], int.parse(monthCountArrRegVsApp2[i]),charts.MaterialPalette.cyan.shadeDefault));
    }

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Total Registration',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn:(OrdinalSales sales, _) => sales.color,
        data: dataOne,
        labelAccessorFn: (OrdinalSales row, _) => '${row.sales}',
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Total Approach',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn:(OrdinalSales sales, _) => sales.color,
        data: dataTwo,
        labelAccessorFn: (OrdinalSales row, _) => '${row.sales}',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      primaryMeasureAxis: new charts.NumericAxisSpec(tickProviderSpec:
      new charts.BasicNumericTickProviderSpec(desiredMinTickCount: 5)),
      _createSampleData(),
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
          barRendererDecorator: new charts.BarLabelDecorator(
              labelPosition: charts.BarLabelPosition.outside)),
      behaviors: [
        new charts.SeriesLegend(
          horizontalFirst: false,
          showMeasures: false,
          position: charts.BehaviorPosition.bottom,
          desiredMaxRows: 1,
          desiredMaxColumns: 2,
          outsideJustification: charts.OutsideJustification.startDrawArea,
        )],
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;
  OrdinalSales(this.year, this.sales,this.color);
}
