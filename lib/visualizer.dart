import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'home.dart';
import "dart:async";

class Visualizer extends StatefulWidget {

  final Data data;

  Visualizer({Key key, this.data}) : super(key: key);

  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                title: new Text('Enjoyed.?'),
                content: new Text('Wanna try again'),
                actions: <Widget>[
                  OutlineButton(
                      child: new Text("Yes"),
                      onPressed: _doSomething,
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      shape: StadiumBorder(),
                      splashColor: Colors.amber,
                    ),
                  ],
                ),
              );
  }

  void _doSomething() {
    Navigator.of(context).pop(true);
    setState(() {
      newArray = [];
    });
  }

  static List newArray = [];

  void createArray(int size){
    final random = Random();

    for(int i=0 ; i< size ; i++){
      newArray.add(random.nextInt(100));
    }
    print('New Array $newArray');
  }
  bubbleSort(List list) async {
  if (list == null || list.length == 0) return;

  var counter=0;
  int n = list.length;
  int i, step;
  for (step = 0; step < n; step++) {
   // await new Future.delayed(const Duration(seconds: 1));

    for ( i = 0; i < n - step - 1; i++) {
      await new Future.delayed(const Duration(milliseconds: 1200));
      if(list.isNotEmpty){
        if (list[i] > list[i + 1]) {
          print(counter++);
          swapBubble(list, i);
        }
      }
    }
  }
  
}

  swapBubble(List list, int i){
  
  int temp = list[i];
  list[i] = list[i+1];
  list[i+1] = temp;
  
  print(newArray);

  setState(() {
    newArray = list;
    seriesList = _creatRandomData();
  });  
}



  void selectionSort(List list) async {
    if (list == null || list.length == 0) return;
    int n = list.length;
    int i, steps;
    for (steps = 0; steps < n; steps++) {
      //await new Future.delayed(const Duration(seconds: 0));
      for (i = steps + 1; i < n; i++) {
        await new Future.delayed(const Duration(milliseconds: 500));
        if(list[steps] > list[i]) {
          swapSelection(list, steps, i);
        }
      }
    }
  }

  void swapSelection(List list, int steps, int i) {
  int temp = list[steps];
  list[steps] = list[i];
  list[i] = temp;

  print(newArray);

  setState(() {
    newArray = list;
    seriesList = _creatRandomData();
  });  
}


  
  



  List<charts.Series> seriesList; 
  static int algoIndex = 0, arraySize = 10;

  static List<charts.Series<addChart, String>> _creatRandomData(){

    final desktopSalesData = List<addChart>.generate(
      arraySize,
      (i) => addChart('${newArray[i]}', newArray[i]),
    );

    return[
      new charts.Series<addChart,String>(
        id: 'addChart',
        domainFn: (addChart addChart, _) => addChart.label,
        measureFn: (addChart addChart, _) => addChart.value,
        data: desktopSalesData,
      )];
  }

  @override
  void initState() { 
    super.initState();

    algoIndex = widget.data.algoIndex;
    arraySize = widget.data.arraySize.toInt();
    createArray(arraySize);
    seriesList = _creatRandomData();
  }

  barChart(){

    switch(algoIndex){
      case 0:{ bubbleSort(newArray); } break;
      case 1:{ selectionSort(newArray); } break;
      //case 2:{ quickSort(newArray,0,newArray.length-1); } break;
      
    }

    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      );
   }
    
  @override
  Widget build(BuildContext context) {
      return new WillPopScope(
        onWillPop: _onBackPressed,
        child:   Scaffold(
          body: Container(
          padding: EdgeInsets.all(10.0),
          child: barChart(),
        ),
      ),
    );
  }
}

class addChart{
  final String label;
  final int value;

  addChart(this.label,this.value);
}