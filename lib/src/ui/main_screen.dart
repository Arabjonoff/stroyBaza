import 'package:flutter/material.dart';
import 'package:stroy_baza/src/ui/cart/cart_screen.dart';
import 'package:stroy_baza/src/ui/category/category_screen.dart';
import 'package:stroy_baza/src/ui/home/home_screen.dart';
import 'package:stroy_baza/src/ui/order/order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    CartScreen(),
    Container(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          setState(() {
            selectedIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Asosiy"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded),label: "Buyutrma"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Savat"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box),label: "Profil"),
        ],
      ),
    );
  }
}
