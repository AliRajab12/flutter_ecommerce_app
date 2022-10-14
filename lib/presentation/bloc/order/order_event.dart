import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable{
  const OrderEvent();
}

class FetchOrdersEvent extends OrderEvent{
  const FetchOrdersEvent();

  @override
  List<Object?> get props => [];
}