import 'package:flutter/material.dart';
import 'package:shoppapp/widgets/product_list.dart';
import '../screens/shopping_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  List<Widget> screens = const [
    //if we are on the 0th page we want to show the product list ans if we are on the 1st page we want to show the cart page.
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: IndexedStack(//to maintain the scroll position on the given screen. 
      index: currentPage,
      children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedLabelStyle:const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }
}
