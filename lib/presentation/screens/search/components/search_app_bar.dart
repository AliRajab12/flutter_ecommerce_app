import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/presentation/bloc/search/search_bloc.dart';
import 'package:store/presentation/bloc/search/search_event.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key, required this.queryTextController}) : super(key: key);
  final TextEditingController queryTextController;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBloc>(context);
    return TextField(
      controller: queryTextController,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontFamily: "Raleway",
        fontWeight: FontWeight.w600,
      ),
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
          suffixIcon: queryTextController.text.isEmpty
              ?  null
              : Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: InkWell(child: const Icon(Icons.close),
              onTap: () {
                queryTextController.clear();
              },

            ),
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
    onChanged: (value){
      bloc.add(FetchDataEvent(queryString: value));
    },
      onSubmitted: (value){
        bloc.add(FetchDataEvent(queryString: value));
      },
    );
  }
}