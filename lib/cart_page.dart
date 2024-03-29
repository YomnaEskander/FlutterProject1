import 'package:flutter/material.dart';
import 'package:project/Models/product.dart';
import 'package:provider/provider.dart';
import 'package:project/ShopPage.dart';
import '../Models/shop.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product){
    // show a dialog box to ask the user to confirm remove from cart
    showDialog(context: context, builder: (context) => AlertDialog(
      content: const Text("Remove this item from your cart"),
      actions: [
        // cancel button
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("cancel"),
        ),

        //yes button
        MaterialButton(
          onPressed: () {
            // pop dialog
            Navigator.pop(context);
            //add to cart
            context.read<Shop>().removeFromCart(product);
          },
          child: const Text("Yes"),
        ),
      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
            // get individual item in cart
              final item = cart[index];
              // return as a cart tile
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.price.toStringAsFixed(2)),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => removeItemFromCart(context, item),
                ),
              );

          },),
          ),

          // pay button
        ],
      ),
    );
  }
}
