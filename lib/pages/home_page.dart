import 'package:custom_wish_list/classes/item.dart';
import 'package:custom_wish_list/db/db_helper.dart';
import 'package:custom_wish_list/pages/add_page.dart';
import 'package:custom_wish_list/widgets/appbar_widget.dart';
import 'package:custom_wish_list/widgets/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var list  = DbHelper().init();

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
            clipBehavior: Clip.antiAliasWithSaveLayer,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(screenWidth, double.infinity),
              backgroundColor: const Color.fromARGB(255, 48, 75, 209),
              elevation: 60,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              textStyle: TextStyle(
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.w900,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
            onPressed: () async {
              Item item = await showDialog(
                context: context,
                builder: (BuildContext context) => const AddPage(),
              );
              setState(() {
                items.insert(0, item);
              });
            },
            child: const Text('Add Item!'),
          ),
        ],
        backgroundColor: Colors.transparent,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [AppbarWidget(title: widget.title)],
          body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              background: Container(),
              secondaryBackground: deleteIcon,
              child: TileWidget(
                title: items[index].name,
                index: index,
                price: items[index].price,
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
