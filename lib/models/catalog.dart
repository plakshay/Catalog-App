class catalogModel{
  static final items =[
    Item(
      id: "Codepur001",
      name: "Mi 11",
      desc: "Xiaomi Mi 11 256GB",
      price: 749,
      color: "#ffa500",
      image: "https://example.com/images/mi11.png"
    )
  ];
}
class Item{
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
} 

  
  