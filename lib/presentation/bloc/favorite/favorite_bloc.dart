import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/product.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteInitialState()) {
    on<FetchPopularProductEvent>(_onFetchPopularProductEvent);
    // on<ChangeItemFavoriteEvent>(_onChangeItemFavoriteEvent);
  }
  void _onFetchPopularProductEvent(
      FetchPopularProductEvent event, Emitter<FavoriteState> emitter) async {
    // Change the state to LoadingState
    emitter(const FavoriteLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    List<Product> favoriteProducts =
        demoProducts.where((product) => (product.isFavourite == true)).toList();
    if (favoriteProducts.length >= 0) {
      emitter(
          FavoriteSuccessFetchDataState(favoriteProducts: favoriteProducts));
    } else {
      emitter(const FavoriteErrorFetchDataState(
          errorMessage: "Something went wrong please try again!"));
    }
  }

  // void _onChangeItemFavoriteEvent(
  //     ChangeItemFavoriteEvent event, Emitter<FavoriteState> emitter) {
  //     var isFavorite = demoProducts
  //       .where((product) => (product.id == event.productID))
  //       .first
  //       .isFavourite == (true) ? false : true;
  //     emitter(const FavoriteItemFetchFavoriteState(isFavorite: isFavorite));
  // }
}
