import 'package:flutter/material.dart';

RadialGradient radGradient() {
  return RadialGradient(
    colors: [
      Color.fromARGB(255, 251, 252, 56),
      Color.fromARGB(255, 228, 167, 250),
      Color.fromARGB(255, 250, 223, 133),
      Color.fromARGB(255, 75, 250, 247)
    ],
    center: Alignment(-2.7, 7.4),
    focal: Alignment(2.6, 1.9),
    focalRadius: 3.7,
  );
}
