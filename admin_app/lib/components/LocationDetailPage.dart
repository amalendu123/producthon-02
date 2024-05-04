import 'package:flutter/material.dart';

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
  _EditableLocationDetailPageState createState() => _EditableLocationDetailPageState();
}

class _EditableLocationDetailPageState extends State<EditableLocationDetailPage> {
  late String editedName;
  late int editedDistance;
  late int editedPrice;
  late int editedTotalSpots;
  late int editedAvailableSpots;

  @override
  void initState() {
    super.initState();
    editedName = widget.name;
    editedDistance = widget.distance;
    editedPrice = widget.price;
    editedTotalSpots = widget.totalSpots;
    editedAvailableSpots = widget.availableSpots;
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
                    controller: TextEditingController(text: editedName),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Distance (km)'),
                    onChanged: (value) {
                      setState(() {
                        editedDistance = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: TextEditingController(text: editedDistance.toString()),
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
                    controller: TextEditingController(text: editedPrice.toString()),
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
                    controller: TextEditingController(text: editedTotalSpots.toString()),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(labelText: 'Available Spots'),
                    onChanged: (value) {
                      setState(() {
                        editedAvailableSpots = int.tryParse(value) ?? 0;
                      });
                    },
                    controller: TextEditingController(text: editedAvailableSpots.toString()),
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
                onPressed: () {
                  // Implement logic to save changes
                },
                child: Text('SAVE CHANGES'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
