import 'package:flutter/material.dart';

class Addlocation extends StatefulWidget {
  Addlocation({Key? key}) : super(key: key);

  @override
  _AddlocationState createState() => _AddlocationState();
}

class _AddlocationState extends State<Addlocation> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController totalSlotsController = TextEditingController();
  TextEditingController availableController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  var isPaid = false;

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
                  // Add your logic here to handle adding the location
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
