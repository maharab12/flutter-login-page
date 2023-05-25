import 'package:flutter/material.dart';
class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "turorial";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
        body: Center(
            child: Container(
              child: Text("welcome to $days days $name"),
            )
        ),
      drawer: Drawer(),
      );

  }
}
