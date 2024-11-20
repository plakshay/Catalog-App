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
        body: Column(
          children: [
            cartList().p32().expand(),
            Divider(),
            cartTotal(),

          ],
        )
    );  // scaffold gives us basic functionalities like appBar, bottomnavigator, drawer, floatingActionButton
  }
}

class cartTotal extends StatelessWidget {
  const cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.secondary;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl5.color(accentColor).make(),
          30.widthBox,
         ElevatedButton(
          style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: MyTheme.darkblueColor,
                        
                      ),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content :"Buying not supported yet...".text.make(),
              ),
              );
            }, 
            child: Text("Buy",
            style: TextStyle(
              color: Colors.white
              
            ),
            )
            ).w32(context)
        ],
      ),
    );
  }
}



class cartList extends StatefulWidget { // statefull because we will add a button so that the item can be removed from the cart
  const cartList({super.key});

  @override
  State<cartList> createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){}, 
        icon: Icon(Icons.remove_circle_outline)
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}