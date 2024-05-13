import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppapp/provider/cart_provider.dart';
import 'package:shoppapp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(254, 206, 1, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1)),
            useMaterial3: true,
            fontFamily: 'Lato', //to apply lato to whole project.
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
            ),
            textTheme: const TextTheme(
                titleLarge: TextStyle(fontWeight: FontWeight.w800, fontSize: 35),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
                bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black))),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
