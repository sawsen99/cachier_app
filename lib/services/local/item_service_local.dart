import 'package:cachier_app/models/cart_item.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CartItemServiceLocal extends GetxService {
  late Box<CartItem> cartBox;

  @override
  void onInit() {
    cartBox = Hive.box<CartItem>('cartBox');
    super.onInit();
  }

  Future<Either<String, List<CartItem>>> fetchCartItems() async {
    try {
      List<CartItem> cartItems = cartBox.values.toList();
      return Right(cartItems);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartItem>> addItemToCart(CartItem cartItem) async {
    try {
      int key = await cartBox.add(cartItem);
      CartItem newCartItem = cartBox.get(key)!;
      newCartItem.quantity++;
      return Right(newCartItem);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> deleteItem(int index) async {
    try {
      await cartBox.deleteAt(index);
      return const Right('Item deleted successfully');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartItem>> updateItemQuantity(
      CartItem cartItem, int quantity) async {
    try {
      cartItem.quantity = quantity;
      await cartBox.put(cartItem.key, cartItem);
      return Right(cartItem);
    } catch (e) {
      return Left(e.toString());
    }
  }

  int? getKeyByItem(CartItem cartItem) {
    for (var entry in cartBox.toMap().entries) {
      if (entry.value.id == cartItem.id) {
        return entry.key as int;
      }
    }
    return null;
  }
}
