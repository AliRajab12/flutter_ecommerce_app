
class Category{
  late final int id;
  late final String name;
  late final String image;
  late final bool isSelected;

  Category({required this.id,required this.name,this.isSelected = false,required this.image});

  Map<String, dynamic> toMap()
  {
    return {
      'id' :id,
      'name' : name,
      'image': image,
      'isSelected': isSelected
    };
  }
  Category.fromMap(dynamic map){
    id = map['id'];
    name = map['name'];
    image = map['image'];
    isSelected = map['isSelected'];
  }

  Category toEntity() => Category(
      id: id,
      name: name,
    image: image,
    isSelected: isSelected
  );


}


List<Map<String, dynamic>> categories = [
  {"title": "Wearable"},
  {"title": "Laptop"},
  {"title": "Phones"},
  {"title": "Clock"},
  {"title": "Smartphone"},
  {"title": "Fashion"},
  {"title": "Computers"},
  {"title": "Shoes"},
  {"title": "Drones"},
];