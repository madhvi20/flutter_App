part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class FetchItemsEvent extends ItemEvent {
  @override
  List<Object> get props => [];
}
