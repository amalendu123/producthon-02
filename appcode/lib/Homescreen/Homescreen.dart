import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading:Row(
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
        title:Row(
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
      body: const SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Parking Near You",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ]
        ),
      ),
    );
  }
}