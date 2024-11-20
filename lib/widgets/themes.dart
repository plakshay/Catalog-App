import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData lightTheme( BuildContext context) => ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white ,
          cardColor: Colors.white,
          canvasColor: creamColor,
          colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: darkblueColor, // Accent color
        ).copyWith(secondary: darkblueColor),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color:Colors.black,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightblueColor, // Button background color
            foregroundColor: Colors.white,  // Button text color
          ),
        ),
        );
        
  static ThemeData darkTheme( BuildContext context) => ThemeData(
          // primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
          cardColor: Colors.black,
          canvasColor: darkCreamColor,
          
         colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white , // Accent color
        ),
          // scaffoldBackgroundColor: Colors.white ,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color:const Color.fromARGB(255, 255, 255, 255),
            ),
            ),
             elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
           backgroundColor: darkblueColor, // Button background color
            foregroundColor: Colors.white,  // Button text color
          ),
        ),
      );
        

        //colors
  static Color creamColor = Color(0xfff5f5f5); 
  static Color darkCreamColor = Color.fromARGB(255, 34, 32, 44);    
  static Color darkblueColor = Color.fromARGB(255, 16, 0, 96); 
  static Color lightblueColor = Color.fromARGB(255, 74, 100, 212);       
}