import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomSvgIcon extends StatelessWidget {
  String image;
  double height;
  double width;

  CustomSvgIcon({
    required this.image,
    this.height = 32,
    this.width = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      image: Svg(image),
    );
  }
}
