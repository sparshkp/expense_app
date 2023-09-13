import 'package:expense_app/bar%20graph/individual_bar.dart';

class BarData{
  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuamount;
  final double friamount;
  final double satamount;

  BarData( 
    {
     required this.sunamount, 
     required this.monamount, 
     required this.tueamount, 
     required this.wedamount,
     required this.thuamount,
     required this.friamount, 
     required this.satamount,
});

List<IndividualBar> barData=[];
//initialize the list
void initializeBarData(){
barData=[
  //sunday
  IndividualBar(x: 0, y: sunamount),

  //monday
  IndividualBar(x: 1, y: monamount),

  //tuesday
  IndividualBar(x: 2, y: tueamount),

  //wednesday
  IndividualBar(x: 3, y: wedamount),

  //thursday
  IndividualBar(x: 4, y: thuamount),

  //friday
  IndividualBar(x: 5, y: friamount),

  //saturday
  IndividualBar(x: 6, y: satamount),


];
}

}