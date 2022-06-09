import 'package:destech_study_case/product/constant/image_items.dart';
import 'package:flutter/material.dart';

class UtilityNetworkImage extends Image {
  UtilityNetworkImage.network({Key? key,String? src})
  : super.network(src ?? ImageItems().dummyImage,key : key);
}