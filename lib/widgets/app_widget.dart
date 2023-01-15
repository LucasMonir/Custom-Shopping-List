import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: ThemeData(brightness: Brightness.dark),
          routes: {
            '/': (context) => HomePage(title: title),
          },
        );
      }),
    );
  }
}
