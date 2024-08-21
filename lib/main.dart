import 'package:flutter/material.dart';

import 'features/features.dart';

void main() {
  runApp(const CountriesExplorer());
}

class CountriesExplorer extends StatelessWidget {
  const CountriesExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryPicker(),
    );
  }
}
