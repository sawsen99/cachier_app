import 'package:cachier_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var shopItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void loadFakeData() {
    final fakeData = [
      CartItem(
          0, 'Avocado', 4.00, 'assets/images/avocado.png', Colors.green.value),
      CartItem(
          1, 'Banana', 2.50, 'assets/images/banana.png', Colors.yellow.value),
      CartItem(
          2, 'Chicken', 12.80, 'assets/images/chicken.png', Colors.brown.value),
      CartItem(3, 'Water', 1.00, 'assets/images/water.png', Colors.blue.value),
    ];
    shopItems.assignAll(fakeData);
  }

  void fetchItems() async {
    loadFakeData();
  }
}
