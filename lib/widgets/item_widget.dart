import 'package:flutter/material.dart';

import '../midel/model_catalog.dart';
class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key, required this.item}) :assert(item!=null), super(key: key);
  final Item item;


  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.dec),
        trailing: Text("\$${item.price}",
          textScaleFactor: 1.4,

          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.bold,
        ),),

      ),
    );
  }
}
