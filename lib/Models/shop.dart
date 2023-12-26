import 'package:flutter/cupertino.dart';
import 'package:project/Models/product.dart';

class Shop  extends ChangeNotifier{

  // products for sale
  final List<Product> _shop = [
    // product 1
    Product(
        name: "Product 1",
        price: 99.99 ,
        description: "item description.. more description... ",
    ),
    // product 2
    Product(
      name: "Product 2",
      price: 79.99 ,
      description: "item description",
    ),
    // product 3
    Product(
      name: "Product 3",
      price: 70.99 ,
      description: "item description",
    ),
    // product 4
    Product(
      name: "Product 4",
      price: 199.99 ,
      description: "item description",
    ),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  // add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }
  // remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}