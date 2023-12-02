import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store/widgets/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
            children: [
              Text(
                'My Cart',
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: value.cartItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Image.asset(
                            value.cartItems[index][2],
                            height: 36,
                          ),
                          title: Text(value.cartItems[index][0]),
                          subtitle:
                              Text('R${value.cartItems[index][1].toString()}'),
                          trailing: IconButton(
                              onPressed: () {
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemsFromCart(index);
                              },
                              icon: const Icon(Icons.cancel)),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'R${value.calculateTotal()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'Pay now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
