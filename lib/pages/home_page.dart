import 'package:custom_wish_list/widgets/appbar_widget.dart';
import 'package:custom_wish_list/widgets/bottom_navigation_widget.dart';
import 'package:custom_wish_list/widgets/tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  late List<String> list;
  late String title;
  late Function callback;

  HomePage.callback({super.key, required this.callback});
  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    widget.list = List.generate(20, (index) => 'Item #$index');
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const BottomNavigationWidget(),
        body: CustomScrollView(
          slivers: <Widget>[
            AppbarWidget(title: widget.title),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: widget.list.length,
                (context, index) => Dismissible(
                  key: UniqueKey(),
                  child: TileWidget(
                    title: widget.list[index],
                    index: index,
                    price: index.toString(),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      widget.list.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
