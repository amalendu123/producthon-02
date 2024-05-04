import 'dart:convert';
import 'package:appcode/component/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:appcode/component/Locationcard.dart';
import 'package:http/http.dart' as http;



class Location {
  final int id;
  final String name;
  final int distance;
  final bool isPaid;
  final int price;
  final String image;
  final int totalSlots;
  final int available;

  const Location({
    required this.id,
    required this.name,
    required this.distance,
    required this.isPaid,
    required this.price,
    required this.image,
    required this.totalSlots,
    required this.available,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      name: json['Name'] as String,
      distance: json['distance'] as int,
      isPaid: json['isPaid'] as bool,
      price: json['price'] != null ? json['price'] as int : 0,
      image: json['image'] as String,
      totalSlots: json['totalSlots'] != null ? json['totalSlots'] as int : 0,
      available: json['available'] != null ? json['available'] as int : 0,
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Location>> location;
  @override
  void initState() {
    super.initState();
    location = fetchLocation();
    print(location);
  }

  Future<List<Location>> fetchLocation() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/getlocation'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['searchResults'];

      // Map each item in searchResults to a Location object
      List<Location> locations =
      results.map((json) => Location.fromJson(json)).toList();

      // Return the list of Location objects
      return locations;
    } else {
      throw Exception('Failed to load location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.location_on),
              iconSize: 30,
              onPressed: () {
                // Do something
              },
            ),
            Text(
              "Kollam",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        leadingWidth: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              iconSize: 30,
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(100, 0, 0, 100),
                  items: [
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text('Profile'),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()),
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        // Perform action for Logout
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 140, 77, 208),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Text(
                "Parking Near You",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: FutureBuilder<List<Location>>(
                  future: location, // Pass the location future here
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // While data is being fetched, show a loading indicator.
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      // If an error occurred while fetching data, display an error message.
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      // If data is successfully fetched, display it.
                      var locations = snapshot
                          .data!; // Use snapshot.data to access the list of locations
                      return ListView.builder(
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          var item = locations[index];
                          return SizedBox(
                            height: 300,
                            child: TimelineTile(
                              beforeLineStyle: LineStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              indicatorStyle: IndicatorStyle(
                                width: 10,
                                color: const Color.fromARGB(255, 140, 77, 208),
                                indicator: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              endChild: LocationCard(
                                name: item.name,
                                distance: item.distance,
                                isPaid: item.isPaid,
                                price: item.price,
                                image: item.image,
                                totalSpots: item.totalSlots,
                                availableSpots: item.available,
                                spots: const [
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0",
                                  "0"
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
