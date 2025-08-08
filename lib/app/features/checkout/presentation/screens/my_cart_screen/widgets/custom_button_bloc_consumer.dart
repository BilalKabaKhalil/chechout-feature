import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/payment_cubit/payment_cubit.dart';
import '../../success_screen/success_screen.dart';
import 'custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const SuccessScreen()),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          final SnackBar snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is PaymentCanceled) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: 'Continue',
          onPressed: () {
            context.read<PaymentCubit>().makePayment(
              amount: 100,
              currency: 'USD',
              customerId: 'cus_SpF7w7SIE7znUw',
            );
          },
          isLoading: state is PaymentLoading,
        );
      },
    );
  }
}
