import 'package:flutter/material.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final double width, aspectRatio;

  const ProductCard(
      {Key? key,
      required this.product,
      this.width = 140,
      this.aspectRatio = 1.02})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(20)),
      child: SizedBox(
        width: SizeConfig.getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, ProductDetailsScreen.routeName,
              arguments: widget.product),
          //Navigator.pushNamed(context, ProductDetailsScreen.routeName,arguments: ProductDetailsArgument(product: product))
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(
              aspectRatio: widget.aspectRatio,
              child: Container(
                padding:
                    EdgeInsets.all(SizeConfig.getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Hero(
                  tag: widget.product.id.toString(),
                  child: Image.asset(widget.product.image),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Text widget that contains product title
            Text(
              widget.product.title,
              style: const TextStyle(
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            // Row widgets that contains product's price and favorite state
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "\$${widget.product.price}",
                style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  demoProducts
                      .where((product) => (product.id == widget.product.id))
                      .first
                      .isFavourite = !widget.product.isFavourite;
                  setState(() {});
                },
                child: Container(
                  padding:
                      EdgeInsets.all(SizeConfig.getProportionateScreenWidth(4)),
                  height: SizeConfig.getProportionateScreenWidth(28),
                  width: SizeConfig.getProportionateScreenWidth(28),
                  decoration: BoxDecoration(
                    color: widget.product.isFavourite
                        ? primaryColor.withOpacity(0.15)
                        : secondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    widget.product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.product.isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    size: 20,
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
