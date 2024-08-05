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
          id: 0,
          itemName: 'Avocado',
          itemPrice: 4.00,
          imagePath: 'assets/images/avocado.png',
          color: Colors.green.value,
          quantity: 0),
      CartItem(
          id: 1,
          itemName: 'Banana',
          itemPrice: 2.50,
          imagePath: 'assets/images/banana.png',
          color: Colors.yellow.value,
          quantity: 0),
      CartItem(
          id: 2,
          itemName: 'Chicken',
          itemPrice: 12.80,
          imagePath: 'assets/images/chicken.png',
          color: Colors.brown.value,
          quantity: 0),
      CartItem(
          id: 3,
          itemName: 'Water',
          itemPrice: 1.00,
          imagePath: 'assets/images/water.png',
          color: Colors.blue.value,
          quantity: 0),
    ];
    shopItems.assignAll(fakeData);
  }

  void fetchItems() async {
    loadFakeData();
  }
}
