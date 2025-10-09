import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repos/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartState.initial());

  void getCart() async {
    emit(const CartState.loading());
    final response = await _cartRepo.getCart();
    response.when(
      success: (cartResponse) {
        emit(CartState.success(cartResponse));
      },
      failure: (errorHandler) {
        emit(CartState.error(errorHandler));
      },
    );
  }
}
