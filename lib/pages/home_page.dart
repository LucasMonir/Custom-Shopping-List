import 'dart:io';
import 'package:custom_wish_list/widgets/tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = List.generate(20, (index) => 'Item #$index');
  final Color backgroundButtonColor = Colors.white;
  final Color hoverButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Center(
              child: Text(
                widget.title,
                style: TextStyle(color: Colors.black),
              ),
            ),
            floating: true,
            toolbarHeight: 100,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/header.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: list.length,
              (context, index) => TileWidget(
                title: list[index],
                index: index,
                price: index.toString(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add new item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.close),
            label: 'Add new item',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            print('todo: add item to list');
          }
          if (index == 1) {
            exit(0);
          }
        },
      ),
    );
  }
}
