import 'package:flutter/foundation.dart';

class CartItem {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  // List<CartItem>
  Map<String, CartItem>? _items = {};
  Map<String, CartItem>? get items {
    return {..._items!};
  }

  int get itemCount {
    return 
    // _items == null ? 0 : // if something shows null than it is a way
    _items!.length;
  }

  double? get totalAmount{
    var total = 0.0;
    _items!.forEach((key, cartItemValue) {
      total += cartItemValue.price! * cartItemValue.quantity!;
    });
    return total;
  }

  void addItem(String productID, double price, String title) {
    if (_items!.containsKey(productID) == true) {
      // Change quantity...
      _items!.update(
        productID,
        (existingCartItemValue) => CartItem(
            id: existingCartItemValue.id,
            price: existingCartItemValue.price,
            title: existingCartItemValue.title,
            quantity: existingCartItemValue.quantity! + 1),
      );
    } else {
      _items!.putIfAbsent(
        productID,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
    notifyListeners();
  }
  void removeItem( String productID){
    _items!.remove(productID);
    notifyListeners();

  }
  void clearCart( ){
    _items = {};
    notifyListeners();
  }
  void removeSingleItem(String productID){
    if(!_items!.containsKey(productID) == true){
      return;
      
    }
  if(_items![productID]!.quantity! >1 ){
    _items!.update(productID, (existingCartItemValue) => CartItem(
            id: existingCartItemValue.id,
            price: existingCartItemValue.price,
            title: existingCartItemValue.title,
            quantity: existingCartItemValue.quantity! - 1),
      );
  }else{
    _items!.remove(productID);
  }
  notifyListeners();
  }
}
