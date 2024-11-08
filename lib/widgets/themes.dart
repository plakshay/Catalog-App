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
        
}