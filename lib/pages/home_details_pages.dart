import 'package:flutter/material.dart';
import 'package:test_1/widgets/thekmes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:faker/faker.dart';

import '../midel/model_catalog.dart';
//this page is for displaying  the image after clicking and other
class HomeDetailpage extends StatelessWidget {
  const HomeDetailpage({Key? key, required this.catalog}) :assert(catalog != null),  super(key: key);
  final Item  catalog;

  //this page is for after click the product action .like open the image so on


  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();
    String dummyText = faker.lorem.words(50).join("");
    return Scaffold(
      //this appBar will make a back < opction on the top
      appBar: AppBar(
        //change the color of the back arrow of top
        backgroundColor:Colors.transparent,

      ),
      backgroundColor: MyTheme.creamcolor,
      bottomNavigationBar:   Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: Vx.mOnly(bottom: 10,top: 10),
          children: [
            catalog.price.text.bold.xl3.make(),
            ElevatedButton(onPressed: (){}, child: "Add to card".text.bold.xl3.make(),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      StadiumBorder()
                  )
              ),).wh(165, 60)
          ],
        ).p16(),
      ),
      body:SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            //this is for other option boyond like the text image
            Expanded(child: VxArc(
              height: 30.0,
              arcType:VxArcType.convey ,
              edge: VxEdge.top,

              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [    catalog.name.text.xl2.gray600.bold.make(),
                    catalog.dec.text.textStyle(context.captionStyle).hairLine.bold.center.make(),
                    7.heightBox
                    ,catalog.dec.text.make(),
                    Text(dummyText,style: context.captionStyle,).py32().expand(),

    ],
                ).py64().expand(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
