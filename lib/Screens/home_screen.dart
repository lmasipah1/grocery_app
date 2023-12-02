import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/Screens/cart_page.dart';
import 'package:grocery_store/widgets/cart_model.dart';
import 'package:provider/provider.dart';

import '../widgets/grocery_item_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const CartPage();
        })),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Good morning,
              const SizedBox(height: 75),
              const Text('Good morning'),

              //Let's order fresh items for you
              const SizedBox(height: 10),
              Text(
                'Let\'s order fresh items for you',
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Divider
              const SizedBox(height: 30),
              const Divider(),

              //fresh items
              const SizedBox(height: 30),
              const Text(
                'Fresh items',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),

              //gridview
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1].toString(),
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemsToCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
