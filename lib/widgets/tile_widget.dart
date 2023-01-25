import 'package:flutter/material.dart';

class TileWidget extends StatefulWidget {
  final int index;
  final String title;
  final double price;

  const TileWidget(
      {super.key,
      required this.title,
      required this.index,
      required this.price});
  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        child: ListTile(
          tileColor: const Color.fromARGB(161, 0, 0, 0),
          title: Text(widget.title),
          trailing: Text(widget.price.toString()),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
