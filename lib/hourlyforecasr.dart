import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Column(
          children: [
            Text(
              '09:00',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.cloud,
              size: 32,
            ),
            SizedBox(
              height: 8,
            ),
            Text('3177.6')
          ],
        ),
      ),
    );
  }
}
