import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddLocation extends StatefulWidget {
  AddLocation({Key? key}) : super(key: key);

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController totalSlotsController = TextEditingController();
  TextEditingController availableController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  var isPaid = false;

  void _saveChanges() async {
    try {
      // Create a map of data to be sent in the request body
      Map<String, dynamic> data = {
        'name': nameController.text,
        'location': locationController.text,
        'distance': int.parse(distanceController.text),
        'price': int.parse(priceController.text),
        'totalSlots': int.parse(totalSlotsController.text),
        'availableSlots': int.parse(availableController.text),
        'image': imageController.text,
        'isPaid': isPaid,
      };

      // Send POST request
      var response = await http.post(
        Uri.parse('http://localhost:3000/api/sendLocation'),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Handle success response
        print('Location added successfully!');
      } else {
        // Handle error response
        print('Failed to add location. Status code: ${response.statusCode}');
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
        title: Text('Add Location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: distanceController,
                decoration: InputDecoration(labelText: 'Distance'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: totalSlotsController,
                decoration: InputDecoration(labelText: 'Total Slots'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: availableController,
                decoration: InputDecoration(labelText: 'Available Slots'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image'),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text("Paid Parking"),
                value: isPaid,
                onChanged: (newValue) {
                  setState(() {
                    isPaid = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveChanges(); // Call the method to save changes
                },
                child: Text('Add Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
