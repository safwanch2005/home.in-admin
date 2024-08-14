import 'package:flutter/material.dart';

SizedBox customSizedBox(
    {double height = 1, double width = 1, required context}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height,
    width: MediaQuery.of(context).size.height * width,
  );
}
