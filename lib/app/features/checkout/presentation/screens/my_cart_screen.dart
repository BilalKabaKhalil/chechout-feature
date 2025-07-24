import 'package:flutter/material.dart';

import '../../../../extension/theme_extension.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: context.textStyle.font25W500,
        ),
      ),
    );
  }
}