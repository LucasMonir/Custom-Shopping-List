import 'dart:html';

import 'package:custom_wish_list/widgets/tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = List.generate(80, (index) => 'Item #$index');
  final Color backgroundButtonColor = Colors.white;
  final Color hoverButtonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(widget.title),
          floating: true,
          flexibleSpace: Image.asset('aaaaa'),
          expandedHeight: 50,
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
      ],),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundButtonColor,
        hoverColor: hoverButtonColor,
        elevation: 10,
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
