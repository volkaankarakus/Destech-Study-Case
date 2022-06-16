import 'package:destech_study_case/product/constant/image_items.dart';
import 'package:flutter/material.dart';

class UtilityNetworkImage extends Image {
  UtilityNetworkImage.network(
      {Key? key,
        String? src,BoxFit? fit,double? width,double? height})
  : super.network(
      src ?? ImageItems().dummyImage,
      fit: BoxFit.cover,
      width: 80.0,
      height: 80.0,
      key : key);
}