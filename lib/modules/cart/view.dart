import 'package:cachier_app/modules/cart/widgets/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return CartPage();
  }

  @override
  Widget? tablet() {
    return phone();
  }

  @override
  Widget? desktop() {
    return phone();
  }

  @override
  Widget? watch() {
    return phone();
  }
}
