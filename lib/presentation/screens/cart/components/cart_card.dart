import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/data/models/cart_item.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'icon_button.dart';


class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final int itemIndex;
  const CartItemCard({Key? key, required this.cartItem, required this.itemIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CartBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product's image
        SizedBox(
          width: 88,
          // Container contains product's image
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cartItem.product.image),
            ),
          ),
        ),
        // Product's details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(
              cartItem.product.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                "\$${cartItem.product.price}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,color: primaryColor,
              ),
            ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "Quantity",
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  letterSpacing: 0.52,
                    fontFamily: "Serif"
              ),
              ),
              const SizedBox(width: 10,),
              CartIconButton(
                icon: const Icon(FontAwesomeIcons.minus,size: 10,color: Colors.white,),
                onTap: (){},
                backgroundColor: const Color(0xff7ccbeb),
              ),
              const SizedBox(width: 8,),
              Text("${cartItem.quantity}"),
              const SizedBox(width: 8,),
              CartIconButton(
                icon: const Icon(FontAwesomeIcons.plus,size: 10,color: Colors.white,),
                backgroundColor: const Color(0xff7ccbeb),
                onTap: () {}
                ,
              )
            ],
          ),
          ]),
        const SizedBox(width: 10,),
        IconButton(
            onPressed: (){
              bloc.add(RemoveProductFromCartEvent(itemIndex));
            },
            icon: const Icon(Icons.close,color: Colors.redAccent,),
          splashRadius: 2,
        )
          ],
        );
  }
}
