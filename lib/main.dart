import 'package:flutter/material.dart';
import 'package:test_1/Login.dart';
import 'package:test_1/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/utils/routs.dart';

void main(){
  runApp(Myapp());
  
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily

      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Login(),
        MyRouts.HomeRouts: (context) => const Home_page(),
        MyRouts.LoginRouts: (context) =>  Login(),

      },

    );

  }
}


