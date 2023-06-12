import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

import '../thekmes.dart';
import 'package:flutter/material.dart';

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