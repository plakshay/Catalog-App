import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme( BuildContext context) => ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white ,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color:Colors.black,
            ),
          )
        );
        
  static ThemeData darkTheme( BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        ); 

        //colors
  static Color creamColor = Color(0xfff5f5f5);     
  static Color darkblueColor = Color.fromARGB(255, 16, 0, 96); 
        
}