import 'package:cachier_app/models/cart_item.dart';
import 'package:cachier_app/services/local/item_service_local.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CartController extends GetxController {
  final CartItemServiceLocal cartItemServiceLocal =
      Get.put(CartItemServiceLocal());
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  void fetchCartItems() async {
    isLoading(true);
    final result = await cartItemServiceLocal.fetchCartItems();
    result.fold(
      (error) => print("Error fetching from local storage: $error"),
      (cartList) {
        cartItems.assignAll(cartList);
      },
    );
    isLoading(false);
  }

  void addItemToCart(CartItem cartItem) async {
    final result = await cartItemServiceLocal.addItemToCart(cartItem);
    result.fold(
      (error) => print("Error adding to local storage: $error"),
      (newCartItem) {
        cartItems.add(newCartItem);
      },
    );
  }

  void removeItemFromCart(int index) async {
    final result = await cartItemServiceLocal.deleteItem(index);
    result.fold(
      (error) => print("Error deleting from local storage: $error"),
      (message) {
        print(message);
        cartItems.removeAt(index);
        refresh();
      },
    );
  }

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + item.itemPrice);
  }
}
