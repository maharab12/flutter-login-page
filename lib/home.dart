import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_1/midel/model_catalog.dart';
import 'package:test_1/widgets/drawer.dart';
import 'package:test_1/widgets/item_widget.dart';

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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: (CatalogModel.items.isNotEmpty)
//2 item will come in every coloum
            ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,//for how many product in a row
              mainAxisSpacing: 10,//space of two product
              crossAxisSpacing: 13,
        ),

            itemBuilder: (context,index){
              final item = CatalogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                ),
                  child: GridTile(
                    header: Container(child: Text(item.name
                    ,style: TextStyle(color: Colors.white ),),//color of product name
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent //color of head text
                    ),),
                      child: Image.network(item.image),
                  footer: Text(item.price),));
    },

            itemCount: CatalogModel.items.length)
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
