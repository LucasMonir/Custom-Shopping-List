import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: ((context, child) {
        return MaterialApp(
          color: Colors.black,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: ThemeData(
            brightness: AppController.instance.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          routes: {
            '/': (context) => HomePage(title: title),
          },
        );
      }),
    );
  }
}

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDarkTheme = true;
  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
