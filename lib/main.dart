import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'app/checkout_app.dart';

void main() {
  Stripe.publishableKey = 'pk_test_51RpbGz3htRNIQcxiBiCuVPywdCdRPxcwK0JC75gb6dOonwYdtpZFrOnruH3a1zsDtfbOwMtABRCn8OFhIOLd4Sex00uPqjOj45';
  runApp(const CheckoutApp());
}
