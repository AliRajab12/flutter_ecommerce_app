import 'package:equatable/equatable.dart';
import 'package:store/data/models/product.dart';


abstract class SearchState extends Equatable{
  const SearchState();
}

// Initial state for the search page
class SearchInitialState extends SearchState{

  const SearchInitialState();

  @override
  List<Object?> get props => [];
}
// Loading state for the search page
class SearchLoadingState extends SearchState{
  const SearchLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the search page
class SearchErrorFetchDataState extends SearchState{
  final String errorMessage;
  const SearchErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
// Success state for the search page
class SearchSuccessFetchDataState extends SearchState{
  final List<Product> products;

  const SearchSuccessFetchDataState({required this.products});
  @override

  List<Object?> get props => [];
}
class SearchSuccessFetchProductByCategoryState extends SearchState{
  final List<Product> products;

  const SearchSuccessFetchProductByCategoryState({required this.products});
  @override

  List<Object?> get props => [];
}
