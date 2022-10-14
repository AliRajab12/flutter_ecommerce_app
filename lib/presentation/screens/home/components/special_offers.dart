import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/presentation/bloc/search/search_bloc.dart';
import 'package:store/presentation/bloc/search/search_state.dart';
import 'package:store/presentation/screens/product_details/product_details_screen.dart';

import 'special_offer_card.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<SearchBloc>(context),
        builder: (BuildContext context, SearchState state) {
          return SizedBox(
            height: 425,
            child: Column(
              // shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(10),
                    vertical: SizeConfig.getProportionateScreenWidth(10),
                  ),
                  child: TextButton(
                    child: const Text(
                      "Special For you!",
                    ),
                    onPressed: () {},
                  ),
                ),
                if (state is SearchSuccessFetchProductByCategoryState)
                  (state.products.isEmpty)
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: const Center(
                            child: Text("There are no elements"),
                          ),
                        )
                      : Column(
                          children: [
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    state.products.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: SpecialOfferCard(
                                          category:
                                              state.products[index].category,
                                          image: state.products[index].image,
                                          price: state.products[index].price,
                                          title: state.products[index].title,
                                          onTap: () => Navigator.pushNamed(
                                              context,
                                              ProductDetailsScreen.routeName,
                                              arguments:
                                                  state.products[index])),
                                    ),
                                  ),
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text("See more", style: textStyle),
                                    SizedBox(
                                      width: SizeConfig
                                          .getProportionateScreenHeight(5),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Color(0xff5956e9),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                if (state is SearchErrorFetchDataState)
                  Expanded(
                    child: Center(
                      child: Text(state.errorMessage),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
