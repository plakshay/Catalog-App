import 'package:flutter/material.dart';
import 'package:target10days/models/cart.dart';
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
    final _cart = CartModel(); // in stateless widgets, variables are declared and called withing buildcontext, but in statefull it is declared outside
    final accentColor = Theme.of(context).colorScheme.secondary;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(accentColor).make(),
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
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
     if (_cart.items == null || _cart.items.isEmpty) {
      return "Nothing to show".text.xl3.makeCentered();
    } 
    else 
      { return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(onPressed: (){
          _cart.remove(_cart.items[index]);
          setState(() {
          });
        }, 
        icon: Icon(Icons.remove_circle_outline)
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
  }
}