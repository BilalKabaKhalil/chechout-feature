import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../extension/theme_extension.dart';
import '../../../data/data_source/test_cart_data.dart';
import '../../../data/repositories/cart_repository_imp.dart';
import '../../../domain/usecases/get_cart_data_usecase.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import 'widgets/cart_items.dart';
import 'widgets/custom_button.dart';
import 'widgets/total_price.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(child: SvgPicture.asset('')),
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: context.textStyle.font25W500,
        ),
      ),
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
              Expanded(child: Image.asset('')),
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
              CustomButton(title: 'Complete Payment', onPressed: () {}),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
