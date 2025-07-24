import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../extension/theme_extension.dart';
import 'widgets/cart_items.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: SvgPicture.asset(''),
        ),
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: context.textStyle.font25W500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget> [
            Expanded(child: Image.asset('')),
          ],
        ),
      ),
    );
  }
}