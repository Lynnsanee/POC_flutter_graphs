import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_chart_example_blog/PokemonGraphs.dart';
import 'package:flutter_chart_example_blog/PokemonSalesSeries.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<PokemonSalesSeries> data = [
    PokemonSalesSeries(
        year: 1996,
        sales: 73.52,
        title: "Red/Green/Blue",
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    PokemonSalesSeries(
        year: 1999,
        sales: 42.84,
        title: "Gold/Silver/Crystal",
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    PokemonSalesSeries(
        year: 2002,
        sales: 37.74,
        title: "Ruby/Sapphire/Emerald",
        color: charts.ColorUtil.fromDartColor(Colors.red)),
    PokemonSalesSeries(
        year: 2006,
        sales: 39.24,
        title: "Diamond/Pearl/Platinum",
        color: charts.ColorUtil.fromDartColor(Colors.red)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Graphing Example by Lynnsane',
        home: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PokemonSalesLineChart(data: data),
                flex: 1,
              ),
              Expanded(
                child: PokemonSalesBarChart(
                  data: data,
                ),
                flex: 1,
              )
            ],
          ),
        ));
  }
}
