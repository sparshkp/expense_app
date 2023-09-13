//convert dattime object to a string yyyymmdd
String convertDateTimetoString( DateTime dateTime){
  // year in format -> yyyy
  String year = dateTime.year.toString();

  // year in format -> yyyy
  String month = dateTime.month.toString();
  if(month.length==1) {
    month ="0$month";
  }

  // year in format -> yyyy
  String day = dateTime.day.toString();
  if(day.length==1) {
    day ="0$day";
  }

  String yyyymmdd = year+month+day;
  return yyyymmdd;


}
