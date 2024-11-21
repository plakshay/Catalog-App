import 'package:flutter/material.dart';
import 'package:target10days/core/store.dart';
import 'package:target10days/screens/cart_page.dart';
import 'package:target10days/screens/home_page.dart';
import 'package:target10days/utils/routes.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'screens/login_page.dart';

void main(){
   runApp(VxState( // Vx is the statemanagement
    store: MyStore(), // store is used to store the models that are needed to be manipulated

    child: MyApp()));
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