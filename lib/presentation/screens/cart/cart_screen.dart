import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/presentation/bloc/cart/cart_bloc.dart';
import 'package:store/presentation/bloc/cart/cart_event.dart';
import 'package:store/presentation/widgets/custom_app_bar.dart';
import 'components/cart_body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final bloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + SizeConfig.getProportionateScreenHeight(40)),
      child:  CustomAppBar(
        title: "Basket",
        icon: const Icon(Icons.restore_from_trash,color: Colors.redAccent,),
        onIconTapped: (){
          bloc.add(const ClearCartContentEvent());
        },
      ),
      ),
      body: const CartBody(),
    );
  }
}
