import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/item_bloc.dart';
import 'item_detail_screen.dart';
import '../widgets/item_tile.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ItemTile(item: state.items[index]);
              },
            );
          } else if (state is ItemError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
