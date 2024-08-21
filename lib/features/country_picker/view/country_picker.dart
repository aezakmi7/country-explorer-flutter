import 'package:flutter/material.dart';

import '../../../repository/repository.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final CountryModel _countryModel = CountryModel();
  Map<String, dynamic>? _country;
  bool _isLoading = true;

  @override
  void initState() {
    _fetchCountry();
    super.initState();
  }

  Future<void> _fetchCountry() async {
    try {
      final country = await _countryModel.fetchRandomCountry();
      setState(() {
        _country = country;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Picker'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _country!['name']['common'],
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    _country!['flags']['png'],
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchCountry,
                    child: const Text('Next Country'),
                  ),
                ],
              ),
      ),
    );
  }
}
