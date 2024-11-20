import 'package:flutter/material.dart';
import 'package:target10days/screens/home_detail_page.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
            backgroundColor: MyTheme.creamColor,
            title: Padding(
              padding: const EdgeInsets.only(right: 65),
              child: Center(
                  child: Text("Cart", style: TextStyle(
                    color: context.canvasColor
                  ),)
                  ),
            ),
        ),
    );  // scaffold gives us basic functionalities like appBar, bottomnavigator, drawer, floatingActionButton
  }
}