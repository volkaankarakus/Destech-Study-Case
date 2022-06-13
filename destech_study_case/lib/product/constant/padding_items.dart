import 'package:flutter/material.dart';

class PaddingItems extends EdgeInsets{
  PaddingItems.all() : super.all(20);
  PaddingItems.horizontalNormal() : super.symmetric(horizontal: 15);
  PaddingItems.bottomNormal() : super.only(bottom: 15);
  PaddingItems.topNormal() : super.only(top: 15);
}
