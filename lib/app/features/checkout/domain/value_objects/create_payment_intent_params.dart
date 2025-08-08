class CreatePaymentIntentParams {
  final num amount;
  final String currency, customerId;

  CreatePaymentIntentParams({
    required this.amount,
    required this.currency,
    required this.customerId,
  });
}
