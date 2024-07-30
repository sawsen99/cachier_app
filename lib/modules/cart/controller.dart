import 'package:cachier_app/models/cart_item.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Ensure the cart is empty initially
    fetchCartItems();
  }

  void fetchCartItems() {
    final box = Hive.box<CartItem>('cartBox');
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
    refresh();
  }

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + item.itemPrice);
  }
}
