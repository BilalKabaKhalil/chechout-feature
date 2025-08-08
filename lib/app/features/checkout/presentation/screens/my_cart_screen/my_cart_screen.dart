import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../locator.dart';
import '../../../../../core/constants/image_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../extension/theme_extension.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/payment_cubit/payment_cubit.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/total_price.dart';
import 'widgets/cart_items.dart';
import 'widgets/custom_button.dart';
import 'widgets/payment_method_bottom_sheet.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Cart'),
      body: BlocProvider(
        create: (context) => getIt<CartCubit>()..getCartData(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8),
              Expanded(child: Image.asset(ImageAssets.cartImage)),
              const SizedBox(height: 16),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is GetCartDataSuccess) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 150,
                          child: CartItems(products: state.cart.products),
                        ),
                        Divider(
                          thickness: 2,
                          color: context.colors.surfaceContainerLow,
                          height: 34,
                        ),
                        TotalPrice(totalPrice: state.cart.getTotalPrice),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                title: 'Complete Payment',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: AppColors.whiteColor,
                    builder: (_) => BlocProvider(
                      create: (context) => getIt<PaymentCubit>(),
                      child: const PaymentMethodBottomSheet(),
                    ),
                  );
                  /* Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => PaymentDetailsScreen(
                            getPaymentMethodsListUsecase:
                                GetPaymentMethodsListUsecase(
                                  paymentMethodRepository:
                                      PaymentMethodRepositoryImp(),
                                ),
                          ),
                    ),
                  ); */
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
