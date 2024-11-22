import 'package:target10days/models/cart.dart';
import 'package:target10days/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{ // MyStore stores the information of the models that are needed to be modified

  // creating objects of the model 
  catalogModel catalog= catalogModel();
    
  CartModel cart = CartModel(); 
  
  MyStore(){ // constructor of the class

    cart.catalog= catalog;
  } // null safety, the objects neeeds to be intialised as they cannot be NULLL


}


// with the use of store, we will not be required to make the models again and again , we will have to call an object of the store(class/catalog)
