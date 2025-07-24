import 'package:flutter/material.dart';

import 'features/checkout/presentation/screens/my_cart_screen/my_cart_screen.dart';

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCartScreen(),
    );
  }
}