import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/usecases/get_cart_data_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartDataUseCase getCartDataUseCase;
  CartCubit(this.getCartDataUseCase) : super(CartInitial());

  Future<void> getCartData() async {
    emit(GetCartDataLoading());
    final cart = await getCartDataUseCase.getCartData();
    emit(GetCartDataSuccess(cart: cart));
  }
}
