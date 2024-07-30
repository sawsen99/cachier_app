import 'package:cachier_app/models/cart_item.dart';
import 'package:cachier_app/modules/cart/binding.dart';
import 'package:cachier_app/modules/home/widgets/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  await Hive.openBox<CartItem>('cartBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: CartBinding(),
      home: HomePage(),
    );
  }
}
