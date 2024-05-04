import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:appcode/component/Locationcard.dart';

class Home extends StatefulWidget {
  Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List location =[];

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
              icon: Icon(Icons.location_city),
              onPressed: () {
                // Do something
              },
            ),
            Text("Kollam")
          ],
        ),
        leadingWidth: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Do something
              },
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Parking Near You",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: ListView.builder(
                  itemCount: location.length,
                  itemBuilder: (context, index) {
                    var item = location[index];
                    return SizedBox(
                      height: 300,
                      child: TimelineTile(
                        beforeLineStyle: LineStyle(color: Colors.deepPurple),
                        indicatorStyle: IndicatorStyle(
                          width: 20,
                          color: Colors.deepPurple,
                          indicator: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        endChild: LocationCard(
                          name: item["Name"],
                          distance: item["distance"],
                          isPaid: item["isPaid"],
                          price: item["price"],
                          image: item["image"],
                        ),
                      ),
                    );
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
