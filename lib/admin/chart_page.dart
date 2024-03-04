import 'package:fine_bar_chart/fine_bar_chart.dart';
import 'package:firstproject/admin/category/view_product_one.dart';
import 'package:firstproject/admin/category/view_product_three.dart';
import 'package:firstproject/admin/category/view_product_two.dart';
import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<double> barValue = [
    totalprice1(),
    totalprice2(),
    totalprice3(),
  ];
  List<Color> barColors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
  ];
  List<String> bottomBarName = [
    "Biriyani",
    "Burger",
    "Juices",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text(
            'CHART',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 60),
          child: FineBarChart(
              barWidth: 30,
              barHeight: 300,
              backgroundColors: Colors.white,
              isBottomNameDisable: false,
              isValueDisable: false,
              textStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              barBackgroundColors: Colors.grey.withOpacity(0.3),
              barValue: barValue,
              barColors: barColors,
              barBottomName: bottomBarName),
        ));
  }
}
