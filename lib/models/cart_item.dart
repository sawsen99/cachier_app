import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String itemName;

  @HiveField(2)
  final double itemPrice;

  @HiveField(3)
  final String imagePath;

  @HiveField(4)
  final int color;

  CartItem(this.id, this.itemName, this.itemPrice, this.imagePath, this.color);
}
