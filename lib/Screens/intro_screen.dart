import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Logo
          Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 25),
            child: Image.asset('assets/images/banana.jpg'),
          ),

          //We deliver groceries at your doorstep
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //free items everyday
          const SizedBox(height: 25),
          Text(
            'Fresh items everyday',
            style: TextStyle(color: Colors.grey.shade600),
          ),

          //Get Started button
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomeScreen();
            })),
            child: Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                  color: Colors.purple[600],
                  borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'Get started',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
