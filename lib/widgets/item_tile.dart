import 'package:flutter/material.dart';
import '../models/item.dart';
import '../screens/item_detail_screen.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text(item.description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(item: item),
          ),
        );
      },
    );
  }
}
