import 'package:flutter/material.dart';
import 'package:shoppapp/components/gobal_variables.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
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
          return ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(cartItem['imageUrl']
                  as String), //now background image requires image provider not a widge since image.asset is a widget we don't use it here insted we use assetimage
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size ${cartItem['size']}'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}