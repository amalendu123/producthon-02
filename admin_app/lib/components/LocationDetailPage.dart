import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditableLocationDetailPage extends StatefulWidget {
  final String name;
  final int distance;
  final bool isPaid;
  final int price;
  final String image;
  final int totalSpots;
  final int availableSpots;
  final List spots;

  const EditableLocationDetailPage({
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
  _EditableLocationDetailPageState createState() =>
      _EditableLocationDetailPageState();
}

class _EditableLocationDetailPageState
    extends State<EditableLocationDetailPage> {
  late String editedName;
  late int editedDistance;
  late int editedPrice;
  late int editedTotalSpots;
  late int editedAvailableSpots;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController totalSlotsController = TextEditingController();
  final TextEditingController availableController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  var isPaid = false;

  @override
  void initState() {
    super.initState();
    editedName = widget.name;
    editedDistance = widget.distance;
    editedPrice = widget.price;
    editedTotalSpots = widget.totalSpots;
    editedAvailableSpots = widget.availableSpots;
  }

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
        Uri.parse('http://localhost:3000/api/updateLocation'),
        body: jsonEncode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        // Handle success response
        print('Location Updated successfully!');
      } else {
        // Handle error response
        print(
            'Failed to add location. Status code: ${response.statusCode}');
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
        title: Text('Edit Location'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onChanged: (value) {
                      setState(() {
                        editedName = value;
                      });
                    },
                    controller: nameController
                      ..text = editedName,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Distance (km)'),
                    onChanged: (value) {
                      setState(() {
                        editedDistance = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: distanceController
                      ..text = editedDistance.toString(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Price'),
                    onChanged: (value) {
                      setState(() {
                        editedPrice = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: priceController
                      ..text = editedPrice.toString(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Total Spots'),
                    onChanged: (value) {
                      setState(() {
                        editedTotalSpots = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: totalSlotsController
                      ..text = editedTotalSpots.toString(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Available Spots'),
                    onChanged: (value) {
                      setState(() {
                        editedAvailableSpots = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: availableController
                      ..text = editedAvailableSpots.toString(),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            // Footer
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: ElevatedButton(
                onPressed: _saveChanges,
                child: Text('SAVE CHANGES'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
