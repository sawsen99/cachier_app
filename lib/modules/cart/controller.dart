import 'package:cachier_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    final box = Hive.box<CartItem>('cartBox');
    if (box.isEmpty) {
      // Use provided fake data if no data exists in Hive
      final fakeData = [
        CartItem(
            'Avocado', 4.00, 'assets/images/avocado.png', Colors.green.value),
        CartItem(
            'Banana', 2.50, 'assets/images/banana.png', Colors.yellow.value),
        CartItem(
            'Chicken', 12.80, 'assets/images/chicken.png', Colors.brown.value),
        CartItem('Water', 1.00, 'assets/images/water.png', Colors.blue.value),
      ];
      for (var item in fakeData) {
        box.add(item);
      }
    }
    cartItems.addAll(box.values.toList());
  }

  void addItemToCart(CartItem item) {
    final box = Hive.box<CartItem>('cartBox');
    box.add(item);
    cartItems.add(item);
  }

  void removeItemFromCart(int index) {
    final box = Hive.box<CartItem>('cartBox');
    box.deleteAt(index);
    cartItems.removeAt(index);
  }

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + item.itemPrice);
  }
}
