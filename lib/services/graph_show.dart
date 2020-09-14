import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'graph.dart';
import 'service.dart';

class graph extends StatefulWidget{
  final Widget child;
  graph({Key key,this.child}):super(key:key);
  Graph createState() => Graph();

}
class Graph extends State<graph> {
  // This widget is the root of your application.
  List<charts.Series<Task,String>> _comp;

  _generateData(){
    var pie=[
      new Task("male",60,Colors.blue[900]),
      new Task("female",40,Colors.blueAccent),

    ];

    _comp.add(
      charts.Series(
        data:pie,
        domainFn : (Task task,_) =>task.gender,
        measureFn:(Task task,_) => task.age,
        colorFn:(Task task,_) => charts.ColorUtil.fromDartColor(task.colorval),id:"age and gender",labelAccessorFn: (Task row,_)=>'${row.gender}',

      ),
    );
  }
  void initState(){
    super.initState();
    _comp = List<charts.Series<Task,String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              backgroundColor: Hexcolor('#101935'),
              title: Text('Tests and Confirmed cases'),

          ),

          body:
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text('Comparison'),
                          SizedBox(height: 10.0,),
                          Expanded(
                              child:charts.PieChart(
                                _comp,
                                animate:true,
                                animationDuration: Duration(seconds: 5),
                                behaviors: [
                                  new charts.DatumLegend(
                                      outsideJustification: charts.OutsideJustification.endDrawArea,
                                      horizontalFirst: false,
                                      desiredMaxRows: 2,
                                      cellPadding: new EdgeInsets.only(right: .0,bottom:4.0),
                                      entryTextStyle: charts.TextStyleSpec(color: charts.MaterialPalette.purple.shadeDefault,
                                          fontFamily: "Georgia",
                                          fontSize: 11)
                                  )
                                ],
                                defaultRenderer: new charts.ArcRendererConfig(
                                    arcWidth: 100,
                                    arcRendererDecorators:[
                                      new charts.ArcLabelDecorator(
                                          labelPosition: charts.ArcLabelPosition.inside
                                      )
                                    ]
                                ),
                              ))
                        ],
                      ),
                    )
                ),


          ),
        );
  }
}

class Task{
  String gender;
  int age;
  Color colorval;
  Task(this.gender,this.age,this.colorval);

}
