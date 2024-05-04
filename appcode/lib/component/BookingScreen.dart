import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appcode/Homescreen/Homescreen.dart';

class BookingScreen extends StatelessWidget {
  final String name;
  final int availableSpots;
  final TextEditingController nameController = TextEditingController();

  BookingScreen({
    Key? key,
    required this.name,
    required this.availableSpots,
  }) : super(key: key);

  Future<void> _saveChanges(BuildContext context) async {
    try {
      // Create a map of data to be sent in the request body
      Map<String, dynamic> data = {
        'name': name,
        'availableSlots': availableSpots,
        'number': nameController.text,
      };

      // Send POST request
      var response = await http.post(
        Uri.parse('http://localhost:3000/api/updateLocation2'),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Handle success response
        print('Location Updated successfully!');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Location updated successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle error response
        print('Failed to update location. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        color: Colors.grey[200],
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveChanges(context);
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
