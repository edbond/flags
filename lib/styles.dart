import 'package:flags/colors.dart';
import 'package:flutter/material.dart';

final actionButtonStyle = ButtonStyle(
    padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
    backgroundColor: MaterialStatePropertyAll<Color>(green));
