import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/checkout_app.dart';
import 'app/core/constants/app_keys.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = AppKeys.publishKey;
  initInjectionsInstances();
  runApp(const CheckoutApp());
}
