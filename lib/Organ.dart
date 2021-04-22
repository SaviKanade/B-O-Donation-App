import 'package:flutter/material.dart';
import 'appD.dart';
import 'Blood.dart';

class OrganD extends StatefulWidget {
  @override
  _OrganDState createState() => _OrganDState();
}

class _OrganDState extends State<OrganD> {
  final List<String> organ = ["-", "Eye", "Kidney", "Liver"];
  final List<String> select = ["-", "Blood", "Organ"];

  String selectedoptions = "-";
  String selectedoptions1 = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('ORGAN'),
        backgroundColor: Colors.red,
      ),
      drawer: ADrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Select Type",
            ),
            elevation: 4,
            hint: Container(
              child: Text("Select"),
            ),
            items: select.map((String select) {
              return DropdownMenuItem<String>(
                child: Text(select),
                value: select,
              );
            }).toList(),
            value: selectedoptions,
            onChanged: (value) {
              setState(() {
                if (value == "Blood") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BloodD()));
                } else if (value == "Organ") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OrganD()));
                }
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Select Organ Type:",
            textAlign: TextAlign.left,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: "Organ"),
            elevation: 4,
            hint: Container(
              child: Text("Organ"),
            ),
            items: organ.map((String organ) {
              return DropdownMenuItem<String>(
                child: Text(organ),
                value: organ,
              );
            }).toList(),
            value: selectedoptions1,
            onChanged: (value) {
              setState(() {
                selectedoptions1 = value;
              });
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                "Search for Location:",
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: 190,
              ),
              InkWell(
                radius: 10,
                onTap: () {},
                child: Text(
                  "Current location",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red),
                ),
                prefixIcon: Icon(Icons.location_pin),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
