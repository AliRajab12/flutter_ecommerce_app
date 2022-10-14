import 'package:equatable/equatable.dart';
import 'package:store/data/models/order.dart';


abstract class OrderState extends Equatable{
  const OrderState();
}

class OrderInitialState extends OrderState{
  const OrderInitialState();

  @override
  List<Object?> get props => [];
}

// Loading state for the Favorite page
class OrderLoadingState extends OrderState{
  const OrderLoadingState();

  @override
  List<Object?> get props => [];
}

// Error state for the Favorite page
class OrderErrorFetchDataState extends OrderState{
  final String errorMessage;
  const OrderErrorFetchDataState({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
// Success state for the Favorite page
class OrderSuccessFetchDataState extends OrderState{
  final List<Order> orders;

  const OrderSuccessFetchDataState({required this.orders});
  @override

  List<Object?> get props => [];
}