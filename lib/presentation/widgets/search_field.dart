import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Data/models/product.dart';
import 'package:store/constants/form_field_styles.dart';
import 'package:store/constants/text_style.dart';
import 'package:store/presentation/bloc/search/search_bloc.dart';
import 'package:store/presentation/screens/search/search_screen.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // To prevent open the keyboard
        readOnly: true,
        showCursor: true,
        maxLines: 1,
        style: kSearchFieldTextStyle,
        onTap: () {
          showProductSearchDelegate<Product>(
              context: context,
              delegate: ProductSearchDelegate(
                  productBloc: BlocProvider.of<SearchBloc>(context)));
        },
        decoration: searchFieldInputDecoration);
  }
}
