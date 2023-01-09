import 'package:custom_wish_list/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Center(
            child: Text('Shopping list'),
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          const CardWidget(title: 'aaaa', price: 1111),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(197, 172, 97, 252),
        hoverColor: const Color.fromARGB(197, 95, 53, 139),
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
