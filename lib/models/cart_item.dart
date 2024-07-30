import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String itemName;

  @HiveField(1)
  final double itemPrice;

  @HiveField(2)
  final String imagePath;

  @HiveField(3)
  final int color;

  CartItem(this.itemName, this.itemPrice, this.imagePath, this.color);
}
