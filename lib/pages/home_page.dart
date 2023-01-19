import 'package:custom_wish_list/widgets/appbar_widget.dart';
import 'package:custom_wish_list/widgets/tile_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<String> list = List.generate(11, (index) => '$index');
  final String title;

  HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        persistentFooterButtons: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth, double.infinity),
              backgroundColor: const Color.fromARGB(255, 48, 75, 209),
              elevation: 50,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Colors.black,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
            ),
            onPressed: () {},
            child: const Text('Add Item!'),
          )
        ],
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [AppbarWidget(title: widget.title)],
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.list.length,
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                setState(() {
                  widget.list.removeAt(index);
                });
              },
              background: Container(),
              secondaryBackground: deleteIcon,
              child: TileWidget(
                title: widget.list[index],
                index: index,
                price: index.toString(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final deleteIcon = Container(
    color: Colors.redAccent,
    alignment: Alignment.centerRight,
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(Icons.delete_forever),
    ),
  );
}
