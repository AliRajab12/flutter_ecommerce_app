import 'package:flutter/material.dart';
import 'package:store/data/models/product.dart';
import 'components/custom_app_bar.dart';
import 'components/product_details_content.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Receive object from pushNamed Route
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppBar(
          productId: product.id,
          isProductFavourite: product.isFavourite,
        ),
      ),
      body: DetailsScreenContent(product: product),
    );
  }
}
