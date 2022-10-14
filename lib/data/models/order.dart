
class Order {
  late int id;


  Order({required this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  Order.fromMap(dynamic map) {
    id = map['id'];
  }
  Order toEntity() => Order(id: id);

}

List<Order> demoOrders = [
  Order(id: -1),
  Order(id: -2),
  Order(id: -3),
  Order(id: -4),
];