import 'package:flutter/material.dart';

void main() {
  runApp(DismissibleApp());
}

class DismissibleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissible List',
      debugShowCheckedModeBanner: false,
      home: DismissibleListScreen(),
    );
  }
}

class DismissibleListScreen extends StatefulWidget {
  @override
  _DismissibleListScreenState createState() => _DismissibleListScreenState();
}

class _DismissibleListScreenState extends State<DismissibleListScreen> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            direction: DismissDirection.endToStart, // sağdan sola kaydırma
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item removed')),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: ListTile(
                title: Text(item),
              ),
            ),
          );
        },
      ),
    );
  }
}