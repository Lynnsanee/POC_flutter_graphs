import 'package:charts_flutter/flutter.dart' as charts;

class PokemonSalesSeries {
  final int year;
  final double sales;
  final String title;
  final charts.Color color;

  PokemonSalesSeries(
      {required this.year,
      required this.sales,
      required this.title,
      required this.color});
}
