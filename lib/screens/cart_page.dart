import 'package:flutter/material.dart';
import 'package:target10days/screens/home_detail_page.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:context.canvasColor,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(right: 65),
              child: Center(
                  child: Text("Cart" ),
                  ),
            ),
        ),
    );  // scaffold gives us basic functionalities like appBar, bottomnavigator, drawer, floatingActionButton
  }
}