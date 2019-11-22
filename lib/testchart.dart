import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'home.dart';
import "dart:async";

class TestChart extends StatefulWidget {
  TestChart({Key key}) : super(key: key);

  @override
  _TestChartState createState() => _TestChartState();
}



class _TestChartState extends State<TestChart> {
  
  static List newArray = [];

  void createArray(int size){
    final random = Random();

    for(int i=0 ; i< size ; i++){
      newArray.add(random.nextInt(100));
    }
    print('New Array $newArray');
  }

  static int algoIndex = 0, arraySize = 10;

  
  void bubbleSort(List list) {
  if (list == null || list.length == 0) return;

  int n = list.length;
  int i, step;
  for (step = 0; step < n; step++) {
    for ( i = 0; i < n - step - 1; i++) {
      if (list[i] > list[i + 1]) {
        swap(list, i);
      }
    }
  }
}

Future swap(List list, int i) async{
  await new Future.delayed(const Duration(seconds: 2));
  int temp = list[i];
  list[i] = list[i+1];
  list[i+1] = temp;

  setState(() {
     print(list);
     chartData = List<addChart>.generate(
        arraySize,
        (i) => addChart('$i', list[i]),
      );
  });
}

      static var chartData = List<addChart>.generate(
        arraySize,
        (i) => addChart('$i', newArray[i]),
      );
  
      static var series = [charts.Series(
        id: 'addChart',
        domainFn: (addChart addChart, _) => addChart.label,
        measureFn: (addChart addChart, _) => addChart.value,
        data: chartData
      )];

      var chartdisplay = charts.BarChart(
        series,  
        animate: true,
        vertical: false,
      );


  @override
  void initState() { 
    super.initState();
    createArray(arraySize);
    setState(() {
        chartData = List<addChart>.generate(
        arraySize,
        (i) => addChart('$i', newArray[i]),
      );
  
      series = [charts.Series(
        id: 'addChart',
        domainFn: (addChart addChart, _) => addChart.label,
        measureFn: (addChart addChart, _) => addChart.value,
        data: chartData
      )];

      chartdisplay = charts.BarChart(
        series,  
        animate: true,
        vertical: false,
      );
      bubbleSort(newArray);
    });
    
  }

    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: chartdisplay,
          ),
        );
      }
}

class addChart{
  final String label;
  final int value;

  addChart(this.label,this.value);
}