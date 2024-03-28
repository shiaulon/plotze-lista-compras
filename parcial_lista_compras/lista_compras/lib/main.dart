import 'package:flutter/material.dart';
import 'package:lista_compras/view/tela_login.dart';
import 'models/item_subItem.dart';
import 'view/lista_principal.dart';
import 'view/lista_secundaria.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> items = [
    Item(
      name: 'Lista de compras domingo',
      subItems: [
        SubItem(name: 'Arroz', quantity: '5kg'),
        SubItem(name: 'Feijão', quantity: '1kg'),
        SubItem(name: 'Carne', quantity: '3kg'),
        SubItem(name: 'Detergente', quantity: '2'),
        SubItem(name: 'Buxa', quantity: '1'),
        SubItem(name: 'Chocolate', quantity: '10'),
        SubItem(name: 'Papel higiênico', quantity: '16 rolos'),
      ],
    ),
    Item(
      name: 'Compras para churrasco dia 20',
      subItems: [],
    ),
  ];

  void _onItemTap(Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubItemListScreen(
          item: item,
          onAddSubItem: (itemName, quantity) {
            setState(() {
              item.subItems.add(SubItem(name: itemName, quantity: quantity));
            });
          },
        ),
      ),
    );
  }

  void _onAddItem(String newItemName) {
    setState(() {
      items.add(Item(name: newItemName, subItems: []));
    });
  }

  void _onRemoveItem(Item item) {
    setState(() {
      items.remove(item);
    });
  }

  void _onEditItemName(Item item, String newName) {
    setState(() {
      Item newItem = Item(name: newName, subItems: item.subItems);
      int index = items.indexOf(item);
      items[index] = newItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainListScreen(
      items: items,
      onItemTap: _onItemTap,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onEditItemName: _onEditItemName,
    );
  }
}
