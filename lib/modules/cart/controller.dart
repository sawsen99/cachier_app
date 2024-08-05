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
    isLoading(true);
    final result = await cartItemServiceLocal.addItemToCart(cartItem);
    result.fold(
      (error) => print("Error adding to local storage: $error"),
      (newCartItem) {
        cartItems.add(newCartItem);
      },
    );
    isLoading(false);
  }

  void removeItemFromCart(CartItem cartItem, int index) async {
    isLoading(true);
    final result = await cartItemServiceLocal.deleteItem(index);
    cartItem.quantity = 0;
    result.fold(
      (error) => print("Error deleting from local storage: $error"),
      (message) {
        print(message);
        cartItems.removeAt(index);
        refresh();
      },
    );
    isLoading(false);
  }

  void addQuantity(CartItem cartItem) async {
    isLoading(true);
    final result = await cartItemServiceLocal.updateItemQuantity(
        cartItem, cartItem.quantity + 1);
    result.fold(
      (error) => print("Error updating quantity: $error"),
      (updatedItem) {
        refresh();
      },
    );
    isLoading(false);
  }

  void reduceQuantity(CartItem cartItem, int index) async {
    isLoading(true);
    if (cartItem.quantity > 1) {
      final result = await cartItemServiceLocal.updateItemQuantity(
        cartItem,
        cartItem.quantity - 1,
      );

      result.fold(
        (error) => print("Error updating quantity: $error"),
        (updatedItem) {
          refresh();
        },
      );
    } else if (cartItem.quantity == 1) {
      final result = await cartItemServiceLocal.deleteItem(index);

      result.fold(
        (error) => print("Error updating quantity: $error"),
        (message) {
          print(message);
          cartItems.removeAt(index);
          refresh();
        },
      );
    }
    isLoading(false);
  }

  double calculateTotal() {
    return cartItems.fold(
        0, (sum, item) => sum + item.itemPrice * item.quantity);
  }
}
