import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartitem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartitem['imageUrl'] as String),
                radius: 30,
              ),
              title: Text(cartitem['title'] as String),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delte Item"),
                          content: const Text("Are you Sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'N0',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 14),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeproduct(cartitem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Yes',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            )
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          }),
    );
  }
}
