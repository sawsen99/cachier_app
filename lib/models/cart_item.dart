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

  @HiveField(5)
  int quantity;

  CartItem(
      {this.id,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.quantity});
}
