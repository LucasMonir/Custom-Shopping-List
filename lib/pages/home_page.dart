import 'package:custom_wish_list/widgets/appbar_widget.dart';
import 'package:custom_wish_list/widgets/bottom_navigation_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            AppbarWidget(title: widget.title),
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
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
