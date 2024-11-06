import 'package:flutter/material.dart';
import 'package:target10days/screens/home_page.dart';

import 'screens/login_page.dart';

void main(){
   runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        
        debugShowCheckedModeBanner: false,
        themeMode:ThemeMode.light ,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        routes:  {
          "/":(context)=>LoginPage(),
          "/home" :(context)=>HomePage(),
          "/login":(context) => LoginPage(),
        },
      );
  }
}