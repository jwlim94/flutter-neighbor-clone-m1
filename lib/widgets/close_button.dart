import 'package:flutter/material.dart';

closeButton(context) {
  return GestureDetector(
    onTap: () => Navigator.pop(context),
    child: const Icon(
      Icons.close_rounded,
      color: Colors.lightBlue,
    ),
  );
}
