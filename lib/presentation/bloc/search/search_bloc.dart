import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/models/product.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  SearchBloc() : super(const SearchInitialState()){
    on<FetchAllProductEvent>(_onFetchAllProductEvent);
    on<FetchDataEvent>(_onFetchDataEvent);
    on<FetchProductByCategoryEvent>(_onFetchProductByCategoryEvent);
  }

  void _onFetchDataEvent(FetchDataEvent event, Emitter<SearchState> emitter)async {
    // Change the state to LoadingState
    emitter(const SearchLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    List<Product> products = demoProducts.where((product) => (product.title.contains(event.queryString))).toList();
    if(products.length >= 0){
      emitter( SearchSuccessFetchDataState(products: products));
    }else{
      emitter( const SearchErrorFetchDataState(errorMessage: "Something went wrong please try again!"));
    }
  }

  void _onFetchProductByCategoryEvent(FetchProductByCategoryEvent event, Emitter<SearchState> emitter)async {
    emitter(const SearchLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    List<Product> products = demoProducts.where((product) => (product.category.contains(event.queryString))).toList();

    if(products.length >= 0){
      emitter( SearchSuccessFetchProductByCategoryState(products: products));
    }else{
      emitter( const SearchErrorFetchDataState(errorMessage: "Something went wrong please try again!"));
    }
  }
  void _onFetchAllProductEvent(FetchAllProductEvent event, Emitter<SearchState> emitter)async {
    List<Product> products = demoProducts;
    if(products.length >= 0){
      emitter( SearchSuccessFetchProductByCategoryState(products: products));
    }else{
      emitter( const SearchErrorFetchDataState(errorMessage: "Something went wrong please try again!"));
    }
  }
}