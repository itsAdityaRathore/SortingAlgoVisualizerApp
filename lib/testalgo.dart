import 'package:flutter/material.dart';
import 'dart:math';

class TestAlgo extends StatefulWidget {
  TestAlgo({Key key}) : super(key: key);

  @override
  _TestAlgoState createState() => _TestAlgoState();
}

class _TestAlgoState extends State<TestAlgo> {

  List newArray = [];

  void createArray(int size){
    
    
    final random = Random();

    for(int i=0 ; i< size ; i++){
      newArray.add(random.nextInt(100));  
    }
  print(newArray);
    
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createArray(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: Text('$newArray'),
       ) ,
    );
  }
}