import 'package:flags/colors.dart';
import 'package:flutter/material.dart';

// pixel 6a, size 411 x 890 @ 2.6
// nexus 4, size 384 x 616 @ 2.0

final actionButtonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
    backgroundColor: MaterialStatePropertyAll<Color>(green));

double getScale(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return height < 800 ? 0.75 : 1.0;
}
