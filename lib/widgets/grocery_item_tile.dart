import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  void Function()? onPressed;

  GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          Image.asset(
            imagePath,
            height: 70,
          ),

          //itemName
          Text(itemName),

          //Price button
          MaterialButton(
            onPressed: onPressed,
            color: color[800],
            child: Text(
              'R$itemPrice',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
