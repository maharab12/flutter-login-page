
import 'package:flutter/cupertino.dart';
import 'package:test_1/pages/home_details_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../pages/home.dart';
import '../../midel/model_catalog.dart';
import 'package:flutter/material.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context)=>HomeDetailpage(catalog: catalog) )),
            child: CatalogItem(catalog: catalog));

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
            Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image)),
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
                    ElevatedButton(onPressed: (){}, child: "Add to card".text.make(),
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