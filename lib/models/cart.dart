import 'package:target10days/models/catalog.dart';

class CartModel {


  // static final cartModel = CartModel._internal(); // singleton class model, it is created when the model is created multiple times in a code so that when we call a class, the same model is called and it doesnt refresh the complete things

  // CartModel._internal();
  // factory CartModel()=> cartModel; // factory is a constructor that returns the instance of an existing class instead of creating a new one

// creating singleton is a bad practise

  // Catalog field // default instialization of constructor
   catalogModel _catalog = catalogModel(); // _xyz represents that it is private, we get it using a getter method

  // Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  // Constructor
  // CartModel(this._catalog);

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
