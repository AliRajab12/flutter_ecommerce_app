import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store/Data/models/product.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/search/search_bloc.dart';
import 'package:store/presentation/screens/search/search_screen.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: TextFormField(
        // To prevent open the keyboard
        readOnly: true,
        showCursor: true,
        maxLines: 1,
        style: const TextStyle(
          color: Color(0xff858585),
          fontSize: 17,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w600,
        ),
        onTap: ()  {
           showProductSearchDelegate<Product>(
              context: context,
              delegate: ProductSearchDelegate(productBloc: BlocProvider.of<SearchBloc>(context)));
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(40),
            vertical: SizeConfig.getProportionateScreenWidth(20)
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black45,
              width: 2
            ),
              borderRadius: BorderRadius.circular(40)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: primaryColor,
                  width: 2,
              ),
            borderRadius: BorderRadius.circular(40)
          ),
          // enabledBorder: InputBorder.none,
          hintText: "Search",
          focusColor: Colors.black,
          prefixIcon: Container(
            margin: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(
              "assets/icons/search.svg",
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 45,
            maxHeight: 45,
          ),
          prefixText:"  "
        ),

      ),
    );
  }
}



