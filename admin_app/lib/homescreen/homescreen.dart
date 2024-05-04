import 'dart:convert';
import 'package:admin_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List location = [];

  Future<void> loadData() async {
    var data = await rootBundle.loadString("assets/location.json");
    setState(() {
      location = json.decode(data)["location"];
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
                child: ListView.builder(
                  itemCount: location.length,
                  itemBuilder: (context, index) {
                    var item = location[index];
                    // return SizedBox(
                    //   height: 300,
                    //   child: TimelineTile(
                    //     beforeLineStyle:
                    //         LineStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    //     indicatorStyle: IndicatorStyle(
                    //       width: 10,
                    //       color: const Color.fromARGB(255, 140, 77, 208),
                    //       indicator: Container(
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.rectangle,
                    //           color: Color.fromARGB(255, 0, 0, 0),
                    //         ),
                    //       ),
                    //     ),
                    //     endChild: LocationCard(
                    //         name: item["Name"],
                    //         distance: item["distance"],
                    //         isPaid: item["isPaid"],
                    //         price: item["price"],
                    //         image: item["image"],
                    //         totalSpots: item["totalSlots"],
                    //         availableSpots: item["available"],
                    //         spots: item["spot"]),
                    //   ),
                    // );
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
