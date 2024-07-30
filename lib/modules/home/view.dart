import 'package:cachier_app/modules/home/widgets/phone/phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenResponsive extends GetResponsiveView {
  @override
  Widget? phone() {
    return HomePage();
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
