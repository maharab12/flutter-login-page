import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_1/midel/model_catalog.dart';
import 'package:test_1/utils/routs.dart';
import 'package:test_1/widgets/home_wigets/catalog_header.dart';
import 'package:test_1/widgets/home_wigets/catalog_list.dart';
import 'package:test_1/widgets/thekmes.dart';
import 'package:velocity_x/velocity_x.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final int days = 30;
  final String name = "tutorial";

  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final jsonStr = await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(jsonStr);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
//to make shpping putton and after pressed the button work
floatingActionButton: FloatingActionButton(onPressed:(){
  Navigator.pushNamed(context, MyRouts.cardRoute);
},
  child: Icon(Icons.shopping_cart),),

//safeArea is for making text/head in the safe area .not to close of mobile up screen
      body:SafeArea(
        child: Container(
          padding: Vx.m4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatologHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                 CircularProgressIndicator().centered().expand(),
              ],
          ),
        ),
      )

    );
  }
}






