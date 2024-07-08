import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/item_bloc.dart';
import 'repositories/item_repository.dart';
import 'screens/item_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => ItemRepository(),
        child: BlocProvider(
          create: (context) => ItemBloc(
            itemRepository: RepositoryProvider.of<ItemRepository>(context),
          )..add(FetchItemsEvent()),
          child: ItemListScreen(),
        ),
      ),
    );
  }
}
