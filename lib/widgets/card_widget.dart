import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final double price;
  const CardWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        heightFactor: 2,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: const Card(
            color: Color.fromARGB(197, 172, 97, 252),
          ),
        ),
      ),
    );
  }
}
