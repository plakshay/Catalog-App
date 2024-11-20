import 'package:target10days/models/catalog.dart';

class CartModel {
  // Catalog field
  catalogModel _catalog; // _xyz represents that it is private, we get it using a getter method

  // Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  // Constructor
  CartModel(this._catalog);

  catalogModel get catalog => _catalog;

  set catalog( catalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }


  // map the cart items with IDs (get items in the cart)

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();


  // Get total price in the cart

  num get totalprice => items.fold(0,(total,current)=> total+current.price);// folding of items is not the summing up, we need to write the logic for it, but we are using it to get the total price (sum)


void add(Item item){// used to add items to the cart
  _itemIds.add(item.id);
}

void remove(Item item){ // remove item from the cart
  _itemIds.remove(item.id);
}
}
