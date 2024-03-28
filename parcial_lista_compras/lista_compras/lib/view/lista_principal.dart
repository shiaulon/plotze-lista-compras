import 'package:flutter/material.dart';
import '../models/item_subItem.dart';

class MainListScreen extends StatefulWidget {
  final List<Item> items;
  final Function(Item) onItemTap;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function(Item, String) onEditItemName;

  MainListScreen({
    required this.items,
    required this.onItemTap,
    required this.onAddItem,
    required this.onRemoveItem,
    required this.onEditItemName,
  });

  @override
  _MainListScreenState createState() => _MainListScreenState();
}



class _MainListScreenState extends State<MainListScreen> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        title: Text('Suas Listas de Compra'),
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
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            final item = widget.items[index];
            return InkWell(
              onTap: () => widget.onItemTap(item),
              onLongPress: () => _showEditDialog(context, item),
              onHover: (isHovering) {
                
              },
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
                    Text(item.name, style: TextStyle(color: Color.fromARGB(255, 44, 2, 51))),
                    IconButton(
                      icon: Icon(Icons.delete),
                      color: Color.fromARGB(255, 44, 2, 51),
                      onPressed: () => _showDeleteConfirmationDialog(context, item),
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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Nome da Nova Lista'),
                content: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(hintText: 'Digite o nome da lista'),
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
                      String newListName = _textEditingController.text;
                      widget.onAddItem(newListName);
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir Lista'),
          content: Text('Tem certeza de que deseja excluir esta lista e seus itens?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                widget.onRemoveItem(item);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, Item item) {
    TextEditingController _editTextEditingController = TextEditingController(text: item.name);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Nome da Lista'),
          content: TextField(
            controller: _editTextEditingController,
            decoration: InputDecoration(hintText: 'Digite o novo nome da lista'),
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
                String editedListName = _editTextEditingController.text;
                widget.onEditItemName(item, editedListName);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}