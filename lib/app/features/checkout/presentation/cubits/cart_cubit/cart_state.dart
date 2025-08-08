part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartDataLoading extends CartState {}

final class GetCartDataField extends CartState {}

final class GetCartDataSuccess extends CartState {
  final Cart cart;

  GetCartDataSuccess({required this.cart});
}
