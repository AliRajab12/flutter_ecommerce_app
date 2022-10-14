import 'package:equatable/equatable.dart';
import 'package:store/data/models/cart_item.dart';

abstract class CartEvent extends Equatable{
  const CartEvent();
}

class AddProductToCartEvent extends CartEvent{

  final CartItem cartItem;
  const AddProductToCartEvent({required this.cartItem});
  @override
  List<Object?> get props => [];
}

class RemoveProductFromCartEvent extends CartEvent{
  final int itemIndex;
  const RemoveProductFromCartEvent(this.itemIndex);

  @override
  List<Object?> get props => [];
}

class ClearCartContentEvent extends CartEvent{
  const ClearCartContentEvent();

  @override
  List<Object?> get props => [];
}

class FetchCartProductsEvent extends CartEvent{
  const FetchCartProductsEvent();

  @override
  List<Object?> get props => [];
}