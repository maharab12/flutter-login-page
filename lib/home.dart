import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_1/midel/model_catalog.dart';
import 'package:test_1/widgets/drawer.dart';
import 'package:test_1/widgets/item_widget.dart';
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
//safeArea is for making text/head in the safe area
      body:SafeArea(
        child: Container(
          padding: Vx.m4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatologHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(child: CircularProgressIndicator(),)
              ],
          ),
        ),
      )

    );
  }
}
class CatologHeader extends StatelessWidget {
  const CatologHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkblue).make(),
        'Trending products'.text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);

      },
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) :assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            CatalogImage(image: catalog.image),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.gray600.bold.make(),
                catalog.dec.text.textStyle(context.captionStyle).make(),
                7.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonPadding: Vx.mOnly(bottom: 10,top: 10),
                  children: [
                    catalog.price.text.bold.make(),
                    ElevatedButton(onPressed: (){}, child: "Buy".text.make(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        StadiumBorder()
                      )
                    ),)
                  ],
                )
              ],
            ))

          ],
        )
    ).white.rounded.square(140).make().p8();//py means padding
  }
}
class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.
    color(MyTheme.creamcolor).make().p4().w40(context);
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('image', image));
  }
}





