import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/image_assets.dart';
import '../../../../../extension/theme_extension.dart';
import '../../../data/data_source/test/test_cart_data.dart';
import '../../../data/repositories/cart_repository_imp.dart';
import '../../../data/repositories/payment_method_repository_imp.dart';
import '../../../domain/usecases/get_cart_data_usecase.dart';
import '../../../domain/usecases/get_payment_methods_list_usecase.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../widgets/custom_app_bar.dart';
import '../payment_details/payment_details.dart';
import 'widgets/cart_items.dart';
import 'widgets/custom_button.dart';
import 'widgets/total_price.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Cart'),
      body: BlocProvider(
        create:
            (context) =>
                CartCubit(GetCartDataUseCase(CartRepositoryImp(TestCartData())))
                  ..getCartData(),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => PaymentDetails(
                            getPaymentMethodsListUsecase:
                                GetPaymentMethodsListUsecase(
                                  paymentMethodRepository:
                                      PaymentMethodRepositoryImp(),
                                ),
                          ),
                    ),
                  );
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
