import 'package:flutter/material.dart';
import 'package:store/data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';

class ProductImages extends StatefulWidget {
  final Product product;

  const ProductImages({Key? key, required this.product}) : super(key: key);

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int _selectedImage = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (SizeConfig.orientation == Orientation.portrait)
          ? EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(5))
          : EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(40)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.red)
      // ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(200),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _selectedImage = value;
                });
              },
              itemCount: widget.product.images.length,
              itemBuilder: (context, index) => AspectRatio(
                aspectRatio: 0.88,
                child: Image.asset(widget.product.images[index]),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // show list of product images
              ...List.generate(widget.product.images.length,
                  (index) => buildSmallProductPreview(index))
            ],
          )
        ],
      ),
    );
  }

  /* Create an container that contains product's image
  when user click on Image the state will change to show the chosen image
   */
  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        width: SizeConfig.getProportionateScreenWidth(48),
        height: SizeConfig.getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: primaryColor.withOpacity(_selectedImage == index ? 1 : 0),
          ),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
