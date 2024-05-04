import 'package:appcode/component/LocationDetailPage.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final int distance;
  final bool isPaid;
  final int price;
  final String image;

  const LocationCard({
    Key? key,
    required this.name,
    required this.distance,
    required this.isPaid,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail page when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailPage(
              name: name,
              distance: distance,
              isPaid: isPaid,
              price: price,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        height: 200,
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '$distance km away',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  isPaid
                      ? Row(
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Paid parking (\$$price)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'Free parking',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
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
