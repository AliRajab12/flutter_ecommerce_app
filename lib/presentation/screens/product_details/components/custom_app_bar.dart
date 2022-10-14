import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/data/models/product.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatefulWidget {
  final int productId;
  late bool isProductFavourite;
   CustomAppBar({
    Key? key,
    required this.isProductFavourite, required this.productId,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.getProportionateScreenWidth(15),
          ),
             Row(
              children: [
                const CustomBackButton(),
                const Spacer(),
                favoriteContainer(),
              ],
            ),
        ],
      ),
    );
  }

  Widget favoriteContainer(){
    return Container(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(15)),
      width: SizeConfig.getProportionateScreenWidth(64),
      decoration: BoxDecoration(
          color: widget.isProductFavourite ? const Color(0xFFFFE6E6) : Colors.black12,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20)
          )
      ),
      child: InkWell(
        onTap: (){
          demoProducts
              .where((product) => (product.id == widget.productId))
              .first.isFavourite = !widget.isProductFavourite;
          setState(() {
            widget.isProductFavourite = demoProducts
                .where((product) => (product.id == widget.productId))
                .first.isFavourite;
          });
        },
        child: Icon(
          widget.isProductFavourite ? Icons.favorite : Icons.favorite_border,
          color: widget.isProductFavourite
              ? const Color(0xFFFF4848)
              : Colors.black,
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }
}

