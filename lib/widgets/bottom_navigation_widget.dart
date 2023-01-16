import 'package:custom_wish_list/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 1) {
          SystemNavigator.pop();
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AddPage();
          },
        );
      },
      backgroundColor: const Color.fromARGB(201, 43, 70, 206),
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
