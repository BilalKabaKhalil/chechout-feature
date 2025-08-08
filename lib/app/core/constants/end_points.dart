class EndPoints {
  EndPoints._();

  static const baseURL = 'https://api.stripe.com/v1';

  static const createPaymentIntent = '$baseURL/payment_intents';
  static const createEphemeralKey = '$baseURL/ephemeral_keys';
}
