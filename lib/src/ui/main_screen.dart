import 'package:flutter/material.dart';
import 'package:stroy_baza/src/ui/category/category_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.indeterminate_check_box),label: "Asosiy"),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded),label: "Buyutrma"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Savat"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box),label: "Profil"),
        ],
      ),
    );
  }
}
