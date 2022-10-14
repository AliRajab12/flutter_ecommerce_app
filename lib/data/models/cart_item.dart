
import 'package:store/data/models/product.dart';

class CartItem{
  late final Product product;
  late final int quantity;

  CartItem({required this.product, required this.quantity});

  Map<String, dynamic> toMap()
  {
    return {
      'product' : product,
      'quantity' : quantity
    };
  }
  CartItem.fromMap(dynamic map){
    product = map['product'];
    quantity = map['quantity'];
  }

  CartItem toEntity() => CartItem(
      product: product,
      quantity: quantity
  );

}