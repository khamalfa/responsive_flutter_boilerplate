import 'package:example/constants/colors.dart';
import 'package:example/layout_bar.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

import 'pages/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
          title: 'hamlet',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
            ),
            scaffoldBackgroundColor: AppColors.primaryBackgroundColor,
            primarySwatch: AppColors.primaryColorSwatch,
          ),
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: child!),
                // LayoutBar()
              ],
            );
          },
          home: MyHomePage(title: 'hamlet')),
    );
  }
}
