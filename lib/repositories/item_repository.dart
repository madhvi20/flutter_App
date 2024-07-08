import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';

class ItemRepository {
  final String apiUrl = 'https://example.com/api/items';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> itemJson = json.decode(response.body);
      return itemJson.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
