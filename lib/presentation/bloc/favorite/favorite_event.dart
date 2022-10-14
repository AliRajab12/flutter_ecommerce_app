import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FetchPopularProductEvent extends FavoriteEvent {
  const FetchPopularProductEvent();

  @override
  List<Object?> get props => [];
}

// class ChangeItemFavoriteEvent extends FavoriteEvent {
//   final int productID;
//   const ChangeItemFavoriteEvent({required this.productID});
//   @override
//   List<Object?> get props => [];
// }

