import 'package:appcode/component/BookingScreen.dart';
import 'package:flutter/material.dart';

class LocationDetailPage extends StatelessWidget {
  final String name;
  final int distance;
  final bool isPaid;
  final int price;
  final String image;
  final int totalSpots;
  final int availableSpots;
  final List spots;

  const LocationDetailPage({
    Key? key,
    required this.name,
    required this.distance,
    required this.isPaid,
    required this.price,
    required this.image,
    required this.totalSpots,
    required this.availableSpots,
    required this.spots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
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
                  const SizedBox(height: 8),
                  Text(
                    'Total Spots: $totalSpots',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Available Spots: $availableSpots',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            // Footer
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookingScreen(
        name: name,
        availableSpots: availableSpots,
      )),
    );
  },
  child: Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(16),
    color: Colors.grey[200],
    child: Text(
      'BOOK PARKING',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
