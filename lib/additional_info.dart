import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final humidity;
  final wind;
  final pressure;
  const AdditionalInfo({
    super.key,
    required this.humidity,
    required this.wind,
    required this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Icon(
              Icons.water_drop,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Humidity'),
            const SizedBox(
              height: 8,
            ),
            Text(
              humidity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.air,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Wind Speed'),
            const SizedBox(
              height: 8,
            ),
            Text(
              wind.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.beach_access,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text('Pressure'),
            const SizedBox(
              height: 8,
            ),
            Text(
              pressure.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
