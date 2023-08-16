import 'package:flutter/material.dart';

class HomeOptionsHamburger extends StatefulWidget {
  const HomeOptionsHamburger({Key? key}) : super(key: key);
  @override
  _HomeOptionsHamburgerState createState() => _HomeOptionsHamburgerState();
}

class _HomeOptionsHamburgerState extends State<HomeOptionsHamburger> {
  Map<String, bool?> checkboxes = {};

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      // width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Text('Options'),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: menuOption('Favorites', Icons.favorite),
          ),
        ],
      ),
    );
  }
}

Widget menuOption(String title, IconData icon) {
  return (TextButton(
    onPressed: () {},
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.grey.shade500,
        ),
        Text(title),
      ],
    ),
  ));
}
