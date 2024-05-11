import 'package:flutter/material.dart';
import 'package:shoppapp/components/gobal_variables.dart';
import 'package:shoppapp/components/products_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = ['All', 'Addidas', 'Nike', 'Bata'];
  // String selectedFilter = filters[0];//we cant do like this.
  //so we will do this using init state and late.
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Shoes\nCollection',
                        style: Theme.of(context).textTheme.titleLarge
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(225, 225, 225, 1),
                                  width: 2)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(225, 225, 225, 1),
                                width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: filters.length,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectedFilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromRGBO(245, 247, 249, 1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80)),
                            labelStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            label: Text(
                              filter,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as double,
                        image: product['imageUrl'] as String,
                        backGroundColor: index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(245, 247, 249, 1),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
