import 'package:flutter/material.dart';
import 'package:target10days/screens/cart_page.dart';
import 'package:target10days/screens/home_page.dart';
import 'package:target10days/utils/routes.dart';
import 'package:target10days/widgets/themes.dart';
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
        theme: MyTheme.lightTheme(context),
        darkTheme:MyTheme.darkTheme(context) ,
        routes:  {
          "/":(context)=>HomePage(),
          MyRoutes.homeroute :(context)=>HomePage(),
          MyRoutes.loginroute:(context) => LoginPage(),
          MyRoutes.cartRoute:(context) => CartPage(),
        },
      );
  }
}