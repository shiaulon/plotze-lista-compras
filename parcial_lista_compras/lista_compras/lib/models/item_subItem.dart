class Item {
  final String name;
  final List<SubItem> subItems;

  Item({required this.name, required this.subItems});
}


class SubItem {
   String name;
   String quantity;
  bool completed; 

  SubItem({
    required this.name,
    required this.quantity,
    this.completed = false, 
  });
}