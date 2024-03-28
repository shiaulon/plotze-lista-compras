import 'package:flutter/material.dart';
import '../models/item_subItem.dart';

class SubItemListScreen extends StatefulWidget {
  final Item item;
  final Function(String, String) onAddSubItem; 

  SubItemListScreen({required this.item, required this.onAddSubItem});

  @override
  _SubItemListScreenState createState() => _SubItemListScreenState();
}

class _SubItemListScreenState extends State<SubItemListScreen> {
  TextEditingController _searchController = TextEditingController();
  late List<SubItem> _filteredSubItems; 
  late List<bool> _itemCheckedState; 

  @override
  void initState() {
    super.initState();
    _filteredSubItems = widget.item.subItems;
    _searchController.addListener(_onSearchChanged);
    _itemCheckedState = List.generate(widget.item.subItems.length, (index) => false);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredSubItems = widget.item.subItems.where((subItem) {
        final name = subItem.name.toLowerCase();
        return name.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(widget.item.name),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color.fromARGB(255, 44, 2, 51),),
            onPressed: () {
              showSearch(context: context, delegate: _SearchDelegate(subItems: widget.item.subItems));
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/white.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _filteredSubItems.length,
          itemBuilder: (context, index) {
            final subItem = _filteredSubItems[index];
            return InkWell(
              onTap: () => _showEditDialog(subItem),
              onLongPress: () => _showDeleteConfirmationDialog(subItem),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 44, 2, 51)),
                  borderRadius: BorderRadius.circular(8.0),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(subItem.name, style: TextStyle(color: Color.fromARGB(255, 44, 2, 51))),
                        Text('Quantidade: ${subItem.quantity}', style: TextStyle(color: Color.fromARGB(255, 44, 2, 51))), 
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _itemCheckedState[index] = !_itemCheckedState[index];
                        });
                      },
                      child: Icon(
                        _itemCheckedState[index] ? Icons.check_circle : Icons.circle_outlined,
                        color: _itemCheckedState[index] ? Colors.green : Color.fromARGB(255, 44, 2, 51),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 44, 2, 51),
        onPressed: () {
          _showAddDialog();
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  void _showAddDialog() {
  String _itemName = '';
  String _itemQuantity = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Novo Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) {
                _itemName = value;
              },
              decoration: InputDecoration(labelText: 'Nome do Item'),
            ),
            TextField(
              onChanged: (value) {
                _itemQuantity = (value) ;
              },
              decoration: InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.onAddSubItem(_itemName, _itemQuantity);
                _itemCheckedState.add(false); 
              });
              Navigator.of(context).pop();
            },
            child: Text('Adicionar'),
          ),
        ],
      );
    },
  );
}

  void _showEditDialog(SubItem subItem) {
    String _itemName = subItem.name;
    String _itemQuantity = subItem.quantity;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  _itemName = value;
                },
                controller: TextEditingController(text: _itemName),
                decoration: InputDecoration(labelText: 'Nome do Item'),
              ),
              TextField(
                onChanged: (value) {
                  _itemQuantity = (value) ;
                },
                controller: TextEditingController(text: _itemQuantity.toString()),
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  subItem.name = _itemName;
                  subItem.quantity = _itemQuantity;
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(SubItem subItem) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Excluir Item'),
        content: Text('Tem certeza de que deseja excluir este item?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.item.subItems.remove(subItem);
                if (_filteredSubItems.contains(subItem)) {
                  _filteredSubItems.remove(subItem); 
                  _itemCheckedState.removeAt(_filteredSubItems.indexOf(subItem)); 
                }
              });
              Navigator.of(context).pop();
            },
            child: Text('Excluir'),
          ),
        ],
      );
    },
  );
}

}

class _SearchDelegate extends SearchDelegate<SubItem> {
  final List<SubItem> subItems;

  _SearchDelegate({required this.subItems});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, SubItem(name: '', quantity: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SubItem> results = subItems.where((subItem) => subItem.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildItemList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SubItem> suggestions = subItems.where((subItem) => subItem.name.toLowerCase().contains(query.toLowerCase())).toList();
    return _buildItemList(suggestions);
  }

  Widget _buildItemList(List<SubItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final subItem = items[index];
        return ListTile(
          title: Text(subItem.name),
          subtitle: Text('Quantidade: ${subItem.quantity}'),
          onTap: () {
            close(context, subItem);
          },
        );
      },
    );
  }
}