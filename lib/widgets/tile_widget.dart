import 'dart:html';

import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final int index;
  final String title;
  final String price;
  final Color oddColor = const Color.fromARGB(197, 172, 97, 252);
  final Color evenColor = const Color.fromARGB(197, 116, 61, 218);

  const TileWidget(
      {super.key,
      required this.title,
      required this.index,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8,
        child: ListTile(
          tileColor: index % 2 == 0 ? evenColor : oddColor,
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

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Center(
  //       heightFactor: 2,
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width,
  //         height: 50,
  //         child: const Card(
  //           color: Color.fromARGB(197, 172, 97, 252),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
