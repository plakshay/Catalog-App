import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:target10days/models/cart.dart';
import 'package:target10days/models/catalog.dart';
import 'package:target10days/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
 final Item catalog;
   AddtoCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  
  final _cart = CartModel();
   
  @override
  Widget build(BuildContext context) {

    bool isInCart = _cart.items.contains(catalog) ?? false;// it is a variable that is made to check id it is added to cart

    return ElevatedButton( 
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: MyTheme.darkblueColor, 
      ),
    onPressed: () {
      isInCart = isInCart.toggle();
      if(!isInCart){
      final _catalog =catalogModel();
      
      _cart.catalog = _catalog;
      _cart.add(catalog);

      }
    }, 
    child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus));
  }
}