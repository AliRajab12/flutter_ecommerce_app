import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  const SearchEvent();
}

class FetchDataEvent extends SearchEvent{
  final String queryString;

  const FetchDataEvent({required this.queryString});

  @override
  List<Object?> get props => [];
}

class FetchProductByCategoryEvent extends SearchEvent{
  final String queryString;
  const FetchProductByCategoryEvent({required this.queryString});

  @override
  List<Object?> get props => [];
}

class FetchAllProductEvent extends SearchEvent{

  const FetchAllProductEvent();

  @override
  List<Object?> get props => [];
}