import 'package:flutter/material.dart';
import 'package:test_1/pages/Login.dart';
import 'package:test_1/pages/home.dart';
import 'package:test_1/utils/routs.dart';
import 'package:test_1/widgets/thekmes.dart';

import 'card_page.dart';


void main(){
  runApp(Myapp());
  
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home_page(),
        MyRouts.HomeRouts: (context) => const Home_page(),
        MyRouts.LoginRouts: (context) =>  Login(),
        MyRouts.cardRoute: (context) => CartPage(),

      },

    );

  }
}


