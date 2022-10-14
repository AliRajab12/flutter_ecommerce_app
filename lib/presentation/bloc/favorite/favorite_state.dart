import 'package:equatable/equatable.dart';
import 'package:store/data/models/product.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteInitialState extends FavoriteState {
  const FavoriteInitialState();

  @override
  List<Object?> get props => [];
}

// Loading state for the Favorite page
class FavoriteLoadingState extends FavoriteState {
  const FavoriteLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the Favorite page
class FavoriteErrorFetchDataState extends FavoriteState {
  final String errorMessage;
  const FavoriteErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}

// Success state for the Favorite page
class FavoriteSuccessFetchDataState extends FavoriteState {
  final List<Product> favoriteProducts;

  const FavoriteSuccessFetchDataState({required this.favoriteProducts});
  @override
  List<Object?> get props => [];
}

// class FavoriteItemFetchFavoriteState extends FavoriteState{
//   const FavoriteItemFetchFavoriteState();
//   @override
//   List<Object?> get props => [];
// }
