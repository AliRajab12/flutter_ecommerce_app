import 'package:flutter/material.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';

import 'product_card.dart';



class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(20)),
            child:  TextButton(
                child: const Text("Popular Products"),
                onPressed: (){},
                ),
          ),
            SizedBox(height: SizeConfig.getProportionateScreenWidth(20)),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                35,10,10,20
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      demoProducts.length,
                        (index) {
                            if(demoProducts[index].isPopular){
                              return ProductCard(product:demoProducts[index]);
                            }
                            return const SizedBox.shrink();
                        }
                    ),
                    SizedBox(width: SizeConfig.getProportionateScreenWidth(40)),
                  ],
                ),
        ),
            )
      ],
    );
  }
}
