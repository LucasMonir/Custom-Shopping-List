import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add Item',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove),
          label: 'Remove Item',
        ),
      ],
    );
  }
}
