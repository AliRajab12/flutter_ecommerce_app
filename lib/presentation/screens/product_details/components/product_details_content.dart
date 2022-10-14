import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/cart_item.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/widgets/default_button.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';


class DetailsScreenContent extends StatelessWidget {
  final Product product;
  const DetailsScreenContent({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CartBloc>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    ProductDescription(product: product, onSeeMorePressed: (){}),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: SizeConfig.getProportionateScreenHeight(8.0)),
                      child: DefaultButton(
                        text: "Add to basket",
                        backgroundColor: primaryColor,
                        forgroundColor: Colors.white,
                        onPressed: (){
                          bloc.add(AddProductToCartEvent(cartItem: CartItem(product: product,quantity: Random().nextInt(10))));
                        },
                      ),
                    ),
                  ],
                )
              ),
        ],
      ),
    );
  }
}
