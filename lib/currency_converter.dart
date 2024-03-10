import 'package:flutter/material.dart';

class CurrencyConverterApp extends StatefulWidget {
  const CurrencyConverterApp({super.key});
  @override
  State createState() => _CurrencyConveter();
}

class _CurrencyConveter extends State<CurrencyConverterApp> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  final border = OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.black, width: 2, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(5));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 152, 165),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 126, 152, 165),
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
              TextField(
                controller: textEditingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                cursorColor: Colors.black54,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monetization_on_outlined),
                    prefixIconColor: Colors.black87,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter the ammount',
                    hintStyle: const TextStyle(color: Colors.black54),
                    focusedBorder: border,
                    enabledBorder: border),
              ),
              const SizedBox(height: 5),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50)),
                  onPressed: () {
                    setState(() {
                      result =
                          double.parse(textEditingController.text) * 277.39;
                    });
                  },
                  child: const Text(
                    'Convert',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
