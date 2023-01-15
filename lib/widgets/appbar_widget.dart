import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 70,
      elevation: 50,
      backgroundColor: const Color.fromARGB(201, 43, 70, 206),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                color: Colors.black,
                blurRadius: 20,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
