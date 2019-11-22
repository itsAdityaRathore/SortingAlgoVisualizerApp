import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sorting_algo_visualizer/visualizer.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  double _lowerValue = 20;
  double _upperValue = 15;
  var _current = 0;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sorting Algo Visualizer"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                    width: 300,
                    height: 160,
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text("Set random array size."),
                        new FlutterSlider(
                          values: [20],
                            max: 50,
                            min: 10,
                            onDragging: (handlerIndex, lowerValue, upperValue) {
                              
                              _lowerValue = lowerValue;
                              _upperValue = upperValue;
                              setState(() =>  _lowerValue = lowerValue);
                            },
                        ),
                        Text('Array Size : '+'${_lowerValue.toInt()}')
                      ],
                    ) 
                  ),
              ),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Container(
                    width: 300,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topCenter,
                    child: getCarousel()
                  ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 90.0,
          child: Text("Press Button To Start Visualizing"),
          alignment: Alignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Visualizer(data: Data(algoIndex: _current, arraySize: _lowerValue)),)
          );
        },
        tooltip: 'Start Visualizing',
        child: Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getCarousel(){
   return new CarouselSlider(
        height: 300.0,
        onPageChanged: (index) {
            setState(() {
              _current = index;
              print(_current);
            });
          },
        items: [
          "Bubble Sort",
          "Selection Sort",
          "Quick Sort",
    
        ].map((i) {
          return Builder(
           
            builder: (BuildContext context) {
              
              return Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber
                ),
                child: Text('$i', style: TextStyle(fontSize: 16.0),)
                
              );
            },         
          );
        }).toList(),  
      );
  }
}

class Data{
  int algoIndex;
  double arraySize;

  Data({this.algoIndex,this.arraySize});
}