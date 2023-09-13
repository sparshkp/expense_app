import 'package:expense_app/data/expense_data.dart';
import 'package:expense_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {

  // initialize Hive
  
  await Hive.initFlutter();


  // open Hivebox
   await Hive.openBox("expense_database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> ExpenseData(),
    builder: (context, child) =>  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,),
      home:  HomePage(),
      ),
    );
    
  }
}

