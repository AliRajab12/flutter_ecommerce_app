import 'package:flutter/material.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/text_style.dart';

import 'product_colors.dart';


class ProductDescription extends StatelessWidget {
  final Product product;
  final GestureTapCallback? onSeeMorePressed;
  const ProductDescription({Key? key, required this.product, this.onSeeMorePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product's title widget
          Padding(
            padding: EdgeInsets.only(
                 bottom: SizeConfig.getProportionateScreenHeight(10)
              ),
            child: Center(
              child: Text(product.title,
                style: productTitleStyle,
            ),
            ),
          ),

          // Product Colors
          ProductColorList(productColors: product.colors),

          // Product Description
          Container(
            margin: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(20)),
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(20),
                right: SizeConfig.getProportionateScreenWidth(64),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product's Headline
                  Text(
                      product.description["headline"]!,
                      style: productHeadlineStyle,
                  ),
                  SizedBox(height: SizeConfig.getProportionateScreenHeight(5),),
                  // Product's description
                  Opacity(
                    opacity: 0.50,
                    child: Text(
                      product.description["description"]!,
                      maxLines: 3,
                      style: productDescriptionStyle,
                    ),
                  ),
                  // See more details button
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.getProportionateScreenWidth(10)
                    ),
                    child: GestureDetector(
                      onTap: (){},
                      child: Row(
                        children:  [
                          const Text(
                            "Full Description",
                            style: textStyle,
                          ),
                          const SizedBox(width: 3,),
                          Icon(Icons.arrow_forward_outlined,
                            size: SizeConfig.getProportionateScreenWidth(20),
                            color: primaryColor,
                            semanticLabel: "See More Details",
                          )
                        ],
                      ),
                    ),
                  ),
                  // Total Price
                     Padding(
                       padding: const EdgeInsets.all(6.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(
                              fontSize: SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                              )),
                          Text("\$${product.price}",style: priceTextStyle,),
                        ],
                    ),
                     ),

                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}
