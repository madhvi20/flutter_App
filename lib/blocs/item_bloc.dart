import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/item.dart';
import '../repositories/item_repository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository itemRepository;

  ItemBloc({required this.itemRepository}) : super(ItemInitial());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is FetchItemsEvent) {
      yield ItemLoading();
      try {
        final items = await itemRepository.fetchItems();
        yield ItemLoaded(items: items);
      } catch (e) {
        yield ItemError(message: e.toString());
      }
    }
  }
}
