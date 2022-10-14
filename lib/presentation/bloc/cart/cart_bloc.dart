import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/cart.dart';
import 'package:store/data/models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  CartBloc():  super(const CartInitialState()){
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCartEvent);
    on<ClearCartContentEvent>(_onClearCartContentEvent);
    on<FetchCartProductsEvent>(_onFetchCartProductsEvent);
  }
  void _onFetchCartProductsEvent(FetchCartProductsEvent event, Emitter<CartState> emitter) {
     // Change the state to LoadingState
    List<CartItem> cartItems = demoCart.products;
    if(cartItems.length >= 0){
      emitter( CartSuccessFetchDataState(cartItems: cartItems));
    }else{
      emitter( const CartErrorFetchDataState(errorMessage: "Something went wrong please try again!"));
    }
  }

   void _onAddProductToCartEvent(AddProductToCartEvent event, Emitter<CartState> emitter) {
     // Change the state to LoadingState

     demoCart.products.add(event.cartItem);
     emitter(const CartItemAddedSuccessfulyState(successMessage: "Item has been added successfully"));
   }

   void _onRemoveProductFromCartEvent(RemoveProductFromCartEvent event, Emitter<CartState> emitter) {
     // Change the state to LoadingState
     demoCart.products.removeAt(event.itemIndex);
     emitter(const CartItemRemovedSuccessfulyState(successMessage: "Item has been removed"));
   }

   void _onClearCartContentEvent(ClearCartContentEvent event, Emitter<CartState> emitter) {
     // Change the state to LoadingState
     demoCart.products.clear();
     if(kDebugMode){
       print(demoCart.products.length);
     }
     emitter(const CartContentRemovedSuccessfulyState(successMessage: "Items have been removed"));

   }
}