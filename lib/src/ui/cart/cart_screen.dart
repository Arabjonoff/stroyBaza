import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Savat"),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 30,
              itemBuilder: (context,index){
            return Container();
          })
        ],
      ),
    );
  }
}
