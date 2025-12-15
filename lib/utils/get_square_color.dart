import 'package:flutter/material.dart';

Color getSquareColor(int row, int col) {
  final bool isLightSquare = (row + col) % 2 == 0;
  return isLightSquare ? Colors.grey[300]! : Colors.grey[600]!;
}
