import 'package:expense_app/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuamount;
  final double friamount;
  final double satamount;


  const BarGraph({
    super.key, 
    required this.sunamount, 
    required this.monamount, 
    required this.tueamount, 
    required this.wedamount,
    required this.thuamount, 
    required this.friamount, 
    required this.satamount, 
    required this.maxY});

  @override
  Widget build(BuildContext context) {
    //initalize the bar data 
    BarData myBarData =BarData(
      sunamount: sunamount,
      monamount: monamount,
      tueamount: tueamount,
      wedamount: wedamount,
      thuamount: thuamount,
      friamount: friamount,
      satamount: satamount
      );

      myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
             getTitlesWidget: getBottomTiles,
          )
        )
        ),
        
      barGroups: myBarData.barData.map((
        data) => BarChartGroupData(
          x: data.x,
          barRods: [
            
          BarChartRodData(
            toY: data.y,
          color: Colors.grey[800],
          width: 25,
          borderRadius: BorderRadius.circular(4),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: maxY,
            color: Colors.grey[200]
          )),
          ],
          ),
          ).toList(),

    ));
   
  }
}
    Widget getBottomTiles(double value,TitleMeta meta){
      const style= TextStyle(fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.grey
      );
      Widget text;
      switch (value.toInt()) {
        case 0:
        text=const Text("S",style: style);
        break;
        case 1:
        text=const Text("M",style: style);
        break;
        case 2:
        text=const Text("T",style: style);
        break;
        case 3:
        text=const Text("W",style: style,);
        break;
        case 4:
        text=const Text("T",style: style,);
        break;
        case 5:
        text=const Text("F",style: style,);
        break;
        case 6:
        text=const Text("S",style: style,);
        break;
        default:
        text =const Text("");
        break;
      }
      return SideTitleWidget( child: text, axisSide: meta.axisSide );
      

    }