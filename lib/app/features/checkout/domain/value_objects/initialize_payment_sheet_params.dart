class InitializePaymentSheetParams {
  final String clientSecret,
      merchantDisplayName,
      customerId,
      customerEphemeralKeySecret;

  InitializePaymentSheetParams({
    required this.clientSecret,
    required this.merchantDisplayName,
    required this.customerId,
    required this.customerEphemeralKeySecret,
  });
}
