import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insert_page extends StatefulWidget {
  insert_page(this.map);
  Map? map;

  @override
  State<insert_page> createState() => _insert_pageState();
}

class _insert_pageState extends State<insert_page> {
  var formkey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var dobController = TextEditingController();

  var cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.map == null ? '' : widget.map!['name'];
    dobController.text = widget.map == null ? '' : widget.map!['dob'];
    cityController.text = widget.map == null ? '' : widget.map!['city'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Name',
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Valied Name";
                        }
                      },
                      controller: nameController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter DOB',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Valied Dob";
                        }
                      },
                      controller: dobController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter City',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Valied City";
                        }
                      },
                      controller: cityController),
                ),
                TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (widget.map == null) {
                          inserUser()
                              .then((value) => Navigator.of(context).pop(true));
                        } else {
                          updatUser(widget.map!['id'])
                              .then((value) => Navigator.of(context).pop(true));
                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updatUser(id) async {
    Map map = {};
    map['name'] = nameController.text;
    map['dob'] = dobController.text;
    map['city'] = cityController.text;

    var response1 = await http.put(
        Uri.parse("https://63133fbdb466aa9b0395c1ab.mockapi.io/Users/$id"),
        body: map);
  }

  Future<void> inserUser() async {
    Map map = {};
    map['name'] = nameController.text;
    map['dob'] = dobController.text;
    map['city'] = cityController.text;

    var response1 = await http.post(
        Uri.parse("https://63133fbdb466aa9b0395c1ab.mockapi.io/Users"),
        body: map);
  }
}
