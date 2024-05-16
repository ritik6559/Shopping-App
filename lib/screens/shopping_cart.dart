import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppapp/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context)
        .cart; // there is one more methd to do this
    // final cart = context.watch<CartProvider>().cart;//with this the provider gets triggered.

    return Scaffold(
      //we can put scaffold inside a scaffold.
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return Dismissible(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Color.fromARGB(255, 236, 97, 87),
                    Color.fromARGB(255, 200, 108, 101),
                    Colors.white
                  ],
                ),
              ),
            ),
            key: Key(cartItem['title']),
            onDismissed: (direction) {
              Provider.of<CartProvider>(context, listen: false)
                  .deleteProduct(cartItem);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Delete product',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    content: const Text(
                        'Are you sure you want to delete the product from cart'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context)
                              .deleteProduct(cartItem);
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  );
                },
              );
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Item deleted'),
              ));
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(cartItem['imageUrl']
                    as String), //now background image requires image provider not a widget since image.asset is a widget we don't use it here insted we use assetimage
              ),
              title: Text(
                cartItem['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size ${cartItem['size']}'),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Delete product',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: const Text(
                              'Are you sure you want to delete the product from cart'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .deleteProduct(cartItem);
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Item deleted'),
                                ));
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
