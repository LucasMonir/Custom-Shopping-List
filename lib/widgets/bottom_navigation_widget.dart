import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(201, 43, 70, 206),
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.add),
          label: 'Add Item',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(Icons.remove),
          label: 'Remove Item',
        ),
      ],
    );
  }
}
