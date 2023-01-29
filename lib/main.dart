import 'package:custom_wish_list/db/db_helper.dart';
import 'package:custom_wish_list/widgets/app_widget.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await DbHelper().init();
  runApp(const AppWidget(title: 'Shopping List'));
}
