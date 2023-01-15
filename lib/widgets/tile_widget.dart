import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final int index;
  final String title;
  final String price;

  const TileWidget(
      {super.key,
      required this.title,
      required this.index,
      required this.price});

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
          tileColor: Colors.black45,
          title: Text(title),
          trailing: Text(price),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
