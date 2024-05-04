import 'package:flutter/material.dart';

class LocationDetailPage extends StatelessWidget {
  final String name;
  final int distance;
  final bool isPaid;
  final int price;
  final String image;

  const LocationDetailPage({
    Key? key,
    required this.name,
    required this.distance,
    required this.isPaid,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Distance: $distance km away',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    isPaid ? 'Paid Parking' : 'Free Parking',
                    style: TextStyle(fontSize: 16),
                  ),
                  if (isPaid)
                    Text(
                      'Price: \$$price',
                      style: TextStyle(fontSize: 16),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
