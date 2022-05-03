import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'PokemonSalesSeries.dart';

class PokemonSalesBarChart extends StatelessWidget {
  const PokemonSalesBarChart({Key? key, required this.data}) : super(key: key);
  final List<PokemonSalesSeries> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PokemonSalesSeries, String>> series = [
      charts.Series(
          id: "Pokémon_Sales_Bar",
          data: data,
          domainFn: (PokemonSalesSeries series, _) => series.year.toString(),
          measureFn: (PokemonSalesSeries series, _) => series.sales,
          colorFn: (PokemonSalesSeries series, _) => series.color),
    ];

    return charts.BarChart(series, animate: true);
  }
}

class PokemonSalesLineChart extends StatelessWidget {
  const PokemonSalesLineChart({Key? key, required this.data}) : super(key: key);
  final List<PokemonSalesSeries> data;

  @override
  Widget build(BuildContext context) {
    int minYear = data
        .reduce((current, next) => current.year < next.year ? current : next)
        .year;
    int maxYear = data
        .reduce((current, next) => current.year > next.year ? current : next)
        .year;
    double minSales = data
        .reduce((current, next) => current.sales < next.sales ? current : next)
        .sales;
    double maxSales = data
        .reduce((current, next) => current.sales > next.sales ? current : next)
        .sales;

    List<charts.Series<PokemonSalesSeries, int>> series = [
      charts.Series(
          id: "Pokémon_Sales_Line",
          data: data,
          domainFn: (PokemonSalesSeries series, _) => series.year,
          measureFn: (PokemonSalesSeries series, _) => series.sales,
          colorFn: (PokemonSalesSeries series, _) => series.color),
    ];

    return charts.LineChart(
      series,
      animate: true,
      domainAxis: charts.NumericAxisSpec(
        tickProviderSpec: const charts.BasicNumericTickProviderSpec(
            zeroBound: false, desiredTickCount: 4),
        viewport: charts.NumericExtents(minYear, maxYear),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
          viewport: charts.NumericExtents(minSales, maxSales)),
    );
  }
}
